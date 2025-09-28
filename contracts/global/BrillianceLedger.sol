// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title BrillianceLedger
/// @notice Immortalizes acts of genius, civic restoration, and emotional consequence mapping
/// @dev Anchors validator-grade brilliance across educational, artistic, and technological sanctums

contract BrillianceLedger {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct BrillianceEvent {
        uint256 id;
        address contributor;
        string domain; // e.g., "STEM", "Art", "Civic Restoration", "Emotional Infrastructure"
        string brillianceTrigger; // e.g., "Invention Deployed", "Legacy Activated", "Youth Talent Ritualized"
        string emotionalTag; // e.g., "Civic brilliance sealed", "Innovation grief healed"
        string restorationAct; // e.g., "Sanctum Funded", "Protocol Broadcasted"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => BrillianceEvent> public events;

    event ValidatorSet(address indexed account, bool status);
    event BrillianceEventTagged(uint256 indexed id, address indexed contributor, string domain);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function tagBrillianceEvent(
        string calldata domain,
        string calldata brillianceTrigger,
        string calldata emotionalTag,
        string calldata restorationAct
    ) external returns (uint256 id) {
        id = nextId++;
        events[id] = BrillianceEvent({
            id: id,
            contributor: msg.sender,
            domain: domain,
            brillianceTrigger: brillianceTrigger,
            emotionalTag: emotionalTag,
            restorationAct: restorationAct,
            timestamp: block.timestamp
        });
        emit BrillianceEventTagged(id, msg.sender, domain);
    }

    function getBrillianceEvent(uint256 id) external view returns (BrillianceEvent memory) {
        return events[id];
    }
}
