// SPDX-License-Identifier: VINVINverseWatcher
pragma solidity ^0.8.0;

contract MiningBehaviorOracle {
    address public scrollmaster;

    struct MinerReport {
        string minerName;
        string originCountry;
        uint256 energyUsage;
        bool usesRenewables;
        bool flaggedForAbuse;
        string communityFeedback;
        uint256 timestamp;
    }

    MinerReport[] public minerChain;

    event OraclePing(string minerName, string originCountry, bool flagged, string feedback, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == scrollmaster, "Only VINVIN controls the scrollvision.");
        _;
    }

    constructor() {
        scrollmaster = msg.sender;
    }

    function logMinerBehavior(
        string memory minerName,
        string memory originCountry,
        uint256 energyUsage,
        bool usesRenewables,
        bool flaggedForAbuse,
        string memory communityFeedback
    ) public onlyMaster {
        minerChain.push(MinerReport(minerName, originCountry, energyUsage, usesRenewables, flaggedForAbuse, communityFeedback, block.timestamp));
        emit OraclePing(minerName, originCountry, flaggedForAbuse, communityFeedback, block.timestamp);
    }

    function getMiner(uint index) external view returns (string memory, string memory, uint256, bool, bool, string memory, uint256) {
        MinerReport memory m = minerChain[index];
        return (m.minerName, m.originCountry, m.energyUsage, m.usesRenewables, m.flaggedForAbuse, m.communityFeedback, m.timestamp);
    }

    function totalReports() external view returns (uint) {
        return minerChain.length;
    }
}
