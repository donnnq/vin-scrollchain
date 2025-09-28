// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title UKBudgetRestorationProtocol
/// @notice Anchors validator-grade budget fairness, equity triggers, and restoration clauses
/// @dev Ritualizes fiscal consequence mapping and emotional infrastructure protection

contract UKBudgetRestorationProtocol {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct RestorationEvent {
        uint256 id;
        string equityTrigger; // e.g., "Pensioner Protection", "Landlord Tax Equity"
        string protectionClause; // e.g., "Health Budget Shielded", "Education Sanctum Preserved"
        string restorationAction; // e.g., "Luxury Tax Activated", "Debt Mercy Protocol Deployed"
        string emotionalTag; // e.g., "Fiscal grief healed", "Budget sanctum restored"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => RestorationEvent> public events;

    event ValidatorSet(address indexed account, bool status);
    event RestorationEventTagged(uint256 indexed id, string equityTrigger, string emotionalTag);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function tagRestorationEvent(
        string calldata equityTrigger,
        string calldata protectionClause,
        string calldata restorationAction,
        string calldata emotionalTag
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        events[id] = RestorationEvent({
            id: id,
            equityTrigger: equityTrigger,
            protectionClause: protectionClause,
            restorationAction: restorationAction,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        });
        emit RestorationEventTagged(id, equityTrigger, emotionalTag);
    }

    function getRestorationEvent(uint256 id) external view returns (RestorationEvent memory) {
        return events[id];
    }
}
