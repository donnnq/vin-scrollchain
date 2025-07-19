// SPDX-License-Identifier: VINVINverseSanction
pragma solidity ^0.8.0;

contract MiningSanctionsEnforcer {
    address public scrollmaster;

    struct OffenseLog {
        string minerName;
        string country;
        string offenseType;
        uint256 fineMultiplier;
        bool banStatus;
        uint256 timestamp;
    }

    OffenseLog[] public logs;

    event MinerSanctioned(string minerName, string offenseType, uint256 fineMultiplier, bool banned, string country, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == scrollmaster, "Only VINVIN may enforce kilig justice.");
        _;
    }

    function logOffense(string memory minerName, string memory country, string memory offenseType, bool banStatus) public onlyMaster {
        uint256 fine = banStatus ? 3 : 1; // triple fine if banned
        logs.push(OffenseLog(minerName, country, offenseType, fine, banStatus, block.timestamp));
        emit MinerSanctioned(minerName, offenseType, fine, banStatus, country, block.timestamp);
    }

    function getOffense(uint index) public view returns (string memory, string memory, string memory, uint256, bool, uint256) {
        OffenseLog memory o = logs[index];
        return (o.minerName, o.country, o.offenseType, o.fineMultiplier, o.banStatus, o.timestamp);
    }
}
