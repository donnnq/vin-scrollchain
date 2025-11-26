// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToMiningGrid {
    string public batchID = "1321.9.130";
    string public steward = "Vinvin";

    address public admin;

    struct MiningStat {
        uint256 hashRate;       // TH/s
        string energySource;    // solar, hydro, fossil, etc.
        uint256 decentralizationScore; // custom metric
        uint256 timestamp;
    }

    MiningStat[] public stats;

    event MiningLogged(uint256 hashRate, string energySource, uint256 decentralizationScore);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logMining(uint256 hashRate, string memory energySource, uint256 decentralizationScore) public onlyAdmin {
        stats.push(MiningStat(hashRate, energySource, decentralizationScore, block.timestamp));
        emit MiningLogged(hashRate, energySource, decentralizationScore);
    }

    function getMining(uint256 index) public view returns (uint256 hashRate, string memory energySource, uint256 decentralizationScore, uint256 timestamp) {
        MiningStat memory m = stats[index];
        return (m.hashRate, m.energySource, m.decentralizationScore, m.timestamp);
    }
}
