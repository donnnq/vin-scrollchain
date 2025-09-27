// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title ODINsEyeSensorFusionProtocol
/// @notice Immortalizes cross-border sensor fusion and launch alert propagation
/// @dev Anchors validator-grade orbital integrity and emotional consequence mapping

contract ODINsEyeSensorFusionProtocol {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct FusionEvent {
        uint256 id;
        string contributingNation; // e.g., "France", "Germany", "Italy"
        string sensorType; // e.g., "Infrared", "Radar", "Telemetry"
        string fusionOutcome; // e.g., "Launch Confirmed", "Trajectory Verified", "False Positive Neutralized"
        string emotionalTag; // e.g., "Sensor fusion corridor activated", "Orbital integrity sealed"
        string propagationAction; // e.g., "Alert broadcast to EU/NATO sanctums"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => FusionEvent> public events;

    event ValidatorSet(address indexed account, bool status);
    event FusionEventTagged(uint256 indexed id, string contributingNation, string emotionalTag);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function tagFusionEvent(
        string calldata contributingNation,
        string calldata sensorType,
        string calldata fusionOutcome,
        string calldata emotionalTag,
        string calldata propagationAction
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        events[id] = FusionEvent({
            id: id,
            contributingNation: contributingNation,
            sensorType: sensorType,
            fusionOutcome: fusionOutcome,
            emotionalTag: emotionalTag,
            propagationAction: propagationAction,
            timestamp: block.timestamp
        });
        emit FusionEventTagged(id, contributingNation, emotionalTag);
    }

    function getFusionEvent(uint256 id) external view returns (FusionEvent memory) {
        return events[id];
    }
}
