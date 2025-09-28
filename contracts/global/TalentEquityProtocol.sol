// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title TalentEquityProtocol
/// @notice Immortalizes hiring fairness, visa grief, and educational investment triggers
/// @dev Anchors validator-grade consequence mapping across labor and innovation corridors

contract TalentEquityProtocol {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct EquityEvent {
        uint256 id;
        string hiringTrigger; // e.g., "H-1B Fee Redirected", "Domestic Talent Funded"
        string fairnessClause; // e.g., "No bias in hiring", "Visa grief redirected"
        string restorationAction; // e.g., "STEM investment deployed", "Hiring subsidy activated"
        string emotionalTag; // e.g., "Talent corridor opened", "Hiring grief healed"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => EquityEvent> public events;

    event ValidatorSet(address indexed account, bool status);
    event EquityEventTagged(uint256 indexed id, string hiringTrigger, string emotionalTag);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function tagEquityEvent(
        string calldata hiringTrigger,
        string calldata fairnessClause,
        string calldata restorationAction,
        string calldata emotionalTag
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        events[id] = EquityEvent({
            id: id,
            hiringTrigger: hiringTrigger,
            fairnessClause: fairnessClause,
            restorationAction: restorationAction,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        });
        emit EquityEventTagged(id, hiringTrigger, emotionalTag);
    }

    function getEquityEvent(uint256 id) external view returns (EquityEvent memory) {
        return events[id];
    }
}
