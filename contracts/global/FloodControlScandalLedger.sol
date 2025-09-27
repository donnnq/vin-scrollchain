// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title FloodControlScandalLedger
/// @notice Immortalizes clause activations across the flood control scandal
/// @dev Anchors breach tagging, emotional consequence mapping, and civic restoration protocols

contract FloodControlScandalLedger {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct ScandalClause {
        uint256 id;
        string corridor; // e.g., "DPWH", "Senate", "Contractor Syndicate"
        string clauseTitle; // e.g., "Basura Cash Breach", "Budget Insertion Cartel", "Senate Implication Protocol"
        string emotionalTag; // e.g., "Floodgate breach ritualized"
        string restorationAction; // e.g., "Seal civic trust corridor and activate audit clause"
        string equityClause; // e.g., "We restore validator-grade consequence across public infrastructure corridors"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => ScandalClause> public clauses;

    event ValidatorSet(address indexed account, bool status);
    event ScandalClauseActivated(uint256 indexed id, string corridor, string emotionalTag);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function activateScandalClause(
        string calldata corridor,
        string calldata clauseTitle,
        string calldata emotionalTag,
        string calldata restorationAction,
        string calldata equityClause
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        clauses[id] = ScandalClause({
            id: id,
            corridor: corridor,
            clauseTitle: clauseTitle,
            emotionalTag: emotionalTag,
            restorationAction: restorationAction,
            equityClause: equityClause,
            timestamp: block.timestamp
        });
        emit ScandalClauseActivated(id, corridor, emotionalTag);
    }

    function getScandalClause(uint256 id) external view returns (ScandalClause memory) {
        return clauses[id];
    }
}
