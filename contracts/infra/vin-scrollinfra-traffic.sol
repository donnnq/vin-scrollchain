// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VaultChainInfra {
    address public planner = msg.sender;

    // Whale ban window (6 AM–6 PM)
    uint public whaleBanStart = 6;
    uint public whaleBanEnd   = 18;

    // Crosswalk for emotional APR pedestrians
    bool public emotionalCrosswalkActive = true;

    mapping(address => bool) public bikeLaneAccess;
    mapping(address => bool) public pedestrianMode;

    event BikeLaneActivated(address user);
    event PedestrianModeActivated(address user);
    event WhaleTxnDeployed(address user, uint timestamp);
    event CrosswalkToggled(bool active);

    modifier onlyWhaleTime() {
        uint hour = (block.timestamp / 3600) % 24;
        require(hour < whaleBanStart || hour > whaleBanEnd, "Whale ban hours active");
        _;
    }

    // Grant bike lane access for high-velocity, low-toxicity txns
    function activateBikeLane(address user) external {
        bikeLaneAccess[user] = true;
        emit BikeLaneActivated(user);
    }

    // Enable pedestrian mode for newbies—auto-guide through crosswalks
    function activatePedestrianMode(address user) external {
        pedestrianMode[user] = true;
        emit PedestrianModeActivated(user);
    }

    // Big transfers only allowed outside whale ban hours
    function deployWhaleTransaction() external onlyWhaleTime {
        emit WhaleTxnDeployed(msg.sender, block.timestamp);
    }

    // Toggle the emotional crosswalk on/off
    function toggleCrosswalk() external {
        emotionalCrosswalkActive = !emotionalCrosswalkActive;
        emit CrosswalkToggled(emotionalCrosswalkActive);
    }

    // Pedestrians cross with ritual clarity
    function crossRoad() external view returns (string memory) {
        require(pedestrianMode[msg.sender], "Activate pedestrian mode first");
        if (emotionalCrosswalkActive) {
            return "Crosswalk ritual passed. Emotional APR stabilized.";
        } else {
            return "Crosswalk offline. Proceed with caution.";
        }
    }
}
