// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinVaultOfSovereignMineralBlessings {
    address public scrollkeeper;

    struct BlessingLog {
        string mineral;
        uint256 extractedValue;
        string allocatedContract;
        uint256 timestamp;
    }

    BlessingLog[] public logs;

    event BlessingRecorded(string mineral, uint256 value, string contractName);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function recordBlessing(string memory mineral, uint256 value, string memory allocatedContract) external onlyScrollkeeper {
        logs.push(BlessingLog(mineral, value, allocatedContract, block.timestamp));
        emit BlessingRecorded(mineral, value, allocatedContract);
    }

    function getBlessing(uint256 index) external view returns (string memory, uint256, string memory, uint256) {
        BlessingLog memory b = logs[index];
        return (b.mineral, b.extractedValue, b.allocatedContract, b.timestamp);
    }

    function totalBlessings() external view returns (uint256) {
        return logs.length;
    }
}
