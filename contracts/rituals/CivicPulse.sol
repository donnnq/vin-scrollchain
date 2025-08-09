// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CivicPulse {
    address public scrollsmith;

    struct PulseData {
        uint256 traineeCount;
        uint256 certifiedCount;
        uint256 stipendTotal;
        uint256 feedbackScore; // 0–100 (symbolic resonance score)
        uint256 lastUpdate;
    }

    mapping(string => PulseData) public barangayPulse;
    string[] public barangayList;

    event PulseUpdated(string barangay, uint256 timestamp);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function updatePulse(
        string calldata barangay,
        uint256 traineeCount,
        uint256 certifiedCount,
        uint256 stipendTotal,
        uint256 feedbackScore
    ) external onlyScrollsmith {
        barangayPulse[barangay] = PulseData(
            traineeCount,
            certifiedCount,
            stipendTotal,
            feedbackScore,
            block.timestamp
        );

        // Add to list if new
        bool exists = false;
        for (uint256 i = 0; i < barangayList.length; i++) {
            if (keccak256(bytes(barangayList[i])) == keccak256(bytes(barangay))) {
                exists = true;
                break;
            }
        }
        if (!exists) {
            barangayList.push(barangay);
        }

        emit PulseUpdated(barangay, block.timestamp);
    }

    function getBarangayPulse(string calldata barangay) external view returns (PulseData memory) {
        return barangayPulse[barangay];
    }

    function listBarangays() external view returns (string[] memory) {
        return barangayList;
    }
}
