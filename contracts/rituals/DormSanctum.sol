// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DormSanctum {
    address public scrollsmith;

    struct Dorm {
        string name;
        uint256 cleanlinessScore; // 0–100
        uint256 foodQualityScore; // 0–100
        bool maintenanceRequested;
    }

    mapping(uint256 => Dorm) public dorms;
    uint256 public dormCount;

    event DormCreated(uint256 dormId, string name);
    event CleanlinessUpdated(uint256 dormId, uint256 score);
    event FoodQualityUpdated(uint256 dormId, uint256 score);
    event MaintenanceRequested(uint256 dormId);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function createDorm(string calldata name) external onlyScrollsmith {
        dorms[dormCount] = Dorm(name, 80, 80, false);
        emit DormCreated(dormCount, name);
        dormCount++;
    }

    function updateCleanliness(uint256 dormId, uint256 score) external onlyScrollsmith {
        require(score <= 100, "Max score is 100");
        dorms[dormId].cleanlinessScore = score;
        emit CleanlinessUpdated(dormId, score);
    }

    function updateFoodQuality(uint256 dormId, uint256 score) external onlyScrollsmith {
        require(score <= 100, "Max score is 100");
        dorms[dormId].foodQualityScore = score;
        emit FoodQualityUpdated(dormId, score);
    }

    function requestMaintenance(uint256 dormId) external {
        dorms[dormId].maintenanceRequested = true;
        emit MaintenanceRequested(dormId);
    }
}
