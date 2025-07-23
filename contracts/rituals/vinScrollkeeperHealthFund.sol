// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinScrollkeeperHealthFund {
    address public scrollkeeper;

    struct HealthAid {
        string patientName;
        string service; // e.g., “checkup”, “surgery”, “medicine”
        uint256 coveredAmount;
        bool approved;
        uint256 timestamp;
    }

    HealthAid[] public aids;

    event HealthSupportGranted(string patientName, string service, uint256 amount);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function grantHealthAid(string memory patientName, string memory service, uint256 amount) external onlyScrollkeeper {
        aids.push(HealthAid(patientName, service, amount, true, block.timestamp));
        emit HealthSupportGranted(patientName, service, amount);
    }

    function totalAidRecords() external view returns (uint256) {
        return aids.length;
    }

    receive() external payable {}
}
