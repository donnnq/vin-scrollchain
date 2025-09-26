// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title RecessionImmunitySanctum
/// @notice Ritualizes audit of productivity breach triggers and seals economic resilience clauses
/// @dev Anchors recession immunity, labor dignity, and planetary consequence mapping

contract RecessionImmunitySanctum {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct RecessionClause {
        uint256 id;
        string region; // e.g., "PH", "USA", "EU"
        string breachTrigger; // e.g., "Shrinking workweek", "Low productivity", "Job stagnation"
        string emotionalTag; // e.g., "Labor dignity breach ritualized"
        string restorationAction; // e.g., "Seal recession override clause and activate resilience sanctum"
        string equityClause; // e.g., "We restore validator-grade economic immunity and planetary consequence"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => RecessionClause> public clauses;

    event ValidatorSet(address indexed account, bool status);
    event RecessionClauseActivated(uint256 indexed id, string region, string emotionalTag);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function activateRecessionClause(
        string calldata region,
        string calldata breachTrigger,
        string calldata emotionalTag,
        string calldata restorationAction,
        string calldata equityClause
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        clauses[id] = RecessionClause({
            id: id,
            region: region,
            breachTrigger: breachTrigger,
            emotionalTag: emotionalTag,
            restorationAction: restorationAction,
            equityClause: equityClause,
            timestamp: block.timestamp
        });
        emit RecessionClauseActivated(id, region, emotionalTag);
    }

    function getRecessionClause(uint256 id) external view returns (RecessionClause memory) {
        return clauses[id];
    }
}
