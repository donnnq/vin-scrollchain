// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title InnovationCorridorLedger
/// @notice Immortalizes STEM investments, brilliance triggers, and civic restoration actions
/// @dev Anchors validator-grade consequence mapping across education and technology sanctums

contract InnovationCorridorLedger {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct InnovationEvent {
        uint256 id;
        string region; // e.g., "Central Luzon", "Midlands", "Detroit"
        string investmentType; // e.g., "STEM Lab", "AI Hub", "Green Energy Corridor"
        string brillianceTrigger; // e.g., "Youth Talent Activated", "Teacher Dignity Restored"
        string emotionalTag; // e.g., "Innovation grief healed", "Civic brilliance ritualized"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => InnovationEvent) public events;

    event ValidatorSet(address indexed account, bool status);
    event InnovationEventTagged(uint256 indexed id, string region, string brillianceTrigger);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function tagInnovationEvent(
        string calldata region,
        string calldata investmentType,
        string calldata brillianceTrigger,
        string calldata emotionalTag
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        events[id] = InnovationEvent({
            id: id,
            region: region,
            investmentType: investmentType,
            brillianceTrigger: brillianceTrigger,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        });
        emit InnovationEventTagged(id, region, brillianceTrigger);
    }

    function getInnovationEvent(uint256 id) external view returns (InnovationEvent memory) {
        return events[id];
    }
}
