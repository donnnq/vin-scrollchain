// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title InfrastructureResilienceLedger
/// @notice Immortalizes infrastructure reform clause activations across planetary corridors
/// @dev Anchors consequence mapping from sectoral audits, civic financing, and energy resilience broadcasts

contract InfrastructureResilienceLedger {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct ReformClause {
        uint256 id;
        string corridor; // e.g., "Energy", "Transport", "Water", "Civic Financing"
        string clauseTitle; // e.g., "Grid Modernization", "Bridge Repair Bonds", "Climate-Proofing Activation"
        string emotionalTag; // e.g., "Resilience clause ritualized"
        string restorationAction; // e.g., "Seal infrastructure sanctum and activate equity clause"
        string equityClause; // e.g., "We restore validator-grade consequence across civic and planetary corridors"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => ReformClause> public clauses;

    event ValidatorSet(address indexed account, bool status);
    event ReformClauseActivated(uint256 indexed id, string corridor, string emotionalTag);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function activateReformClause(
        string calldata corridor,
        string calldata clauseTitle,
        string calldata emotionalTag,
        string calldata restorationAction,
        string calldata equityClause
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        clauses[id] = ReformClause({
            id: id,
            corridor: corridor,
            clauseTitle: clauseTitle,
            emotionalTag: emotionalTag,
            restorationAction: restorationAction,
            equityClause: equityClause,
            timestamp: block.timestamp
        });
        emit ReformClauseActivated(id, corridor, emotionalTag);
    }

    function getReformClause(uint256 id) external view returns (ReformClause memory) {
        return clauses[id];
    }
}
