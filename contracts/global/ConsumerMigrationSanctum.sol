// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title ConsumerMigrationSanctum
/// @notice Tags behavioral shifts and restores trust in legal cannabis corridors
/// @dev Anchors emotional consequence mapping, safety preference tracking, and validator-grade trust restoration

contract ConsumerMigrationSanctum {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct MigrationClause {
        uint256 id;
        string consumerType; // e.g., "Illicit loyalist", "Price-sensitive", "Safety-seeker"
        string migrationTrigger; // e.g., "Tax drop", "Product consistency", "Traceability"
        string emotionalTag; // e.g., "Consumer trust ritualized"
        string restorationAction; // e.g., "Seal corridor and activate education clause"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => MigrationClause> public clauses;

    event ValidatorSet(address indexed account, bool status);
    event MigrationClauseActivated(uint256 indexed id, string consumerType, string emotionalTag);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function activateMigrationClause(
        string calldata consumerType,
        string calldata migrationTrigger,
        string calldata emotionalTag,
        string calldata restorationAction
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        clauses[id] = MigrationClause({
            id: id,
            consumerType: consumerType,
            migrationTrigger: migrationTrigger,
            emotionalTag: emotionalTag,
            restorationAction: restorationAction,
            timestamp: block.timestamp
        });
        emit MigrationClauseActivated(id, consumerType, emotionalTag);
    }

    function getMigrationClause(uint256 id) external view returns (MigrationClause memory) {
        return clauses[id];
    }
}
