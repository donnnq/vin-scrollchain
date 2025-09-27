// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title ODINsEyeOrbitalLedger
/// @notice Immortalizes missile launch detections and consequence activations
/// @dev Anchors validator-grade orbital sovereignty, emotional consequence mapping, and restoration protocols

contract ODINsEyeOrbitalLedger {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct LaunchEvent {
        uint256 id;
        string originNation; // e.g., "Russia", "China", "Unknown"
        string missileType; // e.g., "Ballistic", "Hypersonic", "Cruise"
        string emotionalTag; // e.g., "Orbital breach detected", "Infrared sanctum activated"
        string consequenceTier; // e.g., "Tier 3: Immediate diplomatic alert", "Tier 5: Defense mobilization"
        string restorationAction; // e.g., "Activate EU defense corridor and seal sovereignty protocol"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => LaunchEvent) public events;

    event ValidatorSet(address indexed account, bool status);
    event LaunchEventTagged(uint256 indexed id, string originNation, string emotionalTag);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function tagLaunchEvent(
        string calldata originNation,
        string calldata missileType,
        string calldata emotionalTag,
        string calldata consequenceTier,
        string calldata restorationAction
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        events[id] = LaunchEvent({
            id: id,
            originNation: originNation,
            missileType: missileType,
            emotionalTag: emotionalTag,
            consequenceTier: consequenceTier,
            restorationAction: restorationAction,
            timestamp: block.timestamp
        });
        emit LaunchEventTagged(id, originNation, emotionalTag);
    }

    function getLaunchEvent(uint256 id) external view returns (LaunchEvent memory) {
        return events[id];
    }
}
