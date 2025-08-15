// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract ForeignAidCommissionScroll {
    address public steward;
    uint256 public baseSahod = 1 ether;
    uint256 public stewardCutPercent = 50;

    struct ContractorStats {
        uint256 progressScore; // 0–100
        string style;          // e.g., "Zen Minimalist", "Barangay Brutalist", "Techno-Bamboo"
        bool active;
    }

    mapping(address => ContractorStats) public contractorStats;

    event SahodDistributed(address indexed contractor, uint256 contractorShare, uint256 stewardShare, string style);
    event StatsUpdated(address indexed contractor, uint256 progressScore, string style);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function updateStats(address contractor, uint256 progressScore, string memory style) public onlySteward {
        require(progressScore <= 100, "Score must be <= 100");
        contractorStats[contractor] = ContractorStats(progressScore, style, true);
        emit StatsUpdated(contractor, progressScore, style);
    }

    function distributeSahod(address contractor) public onlySteward {
        ContractorStats memory stats = contractorStats[contractor];
        require(stats.active, "Contractor inactive");

        uint256 bonus = (baseSahod * stats.progressScore) / 1000; // up to +10%
        uint256 totalPay = baseSahod + bonus;
        uint256 stewardShare = (totalPay * stewardCutPercent) / 100;
        uint256 contractorShare = totalPay - stewardShare;

        emit SahodDistributed(contractor, contractorShare, stewardShare, stats.style);
    }
}
