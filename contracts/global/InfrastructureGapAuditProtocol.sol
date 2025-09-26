// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title InfrastructureGapAuditProtocol
/// @notice Tags infrastructure sectoral deficits and seals funding consequence corridors
/// @dev Anchors audit of energy, transport, water, and broadband gaps with validator-grade consequence mapping

contract InfrastructureGapAuditProtocol {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct GapClause {
        uint256 id;
        string sector; // e.g., "Energy", "Water", "Transport", "Broadband"
        string deficitTrigger; // e.g., "Aging grid", "Funding shortfall", "Climate vulnerability"
        string emotionalTag; // e.g., "Infrastructure neglect ritualized"
        string restorationAction; // e.g., "Seal funding corridor and activate resilience clause"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => GapClause> public clauses;

    event ValidatorSet(address indexed account, bool status);
    event GapClauseActivated(uint256 indexed id, string sector, string emotionalTag);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function activateGapClause(
        string calldata sector,
        string calldata deficitTrigger,
        string calldata emotionalTag,
        string calldata restorationAction
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        clauses[id] = GapClause({
            id: id,
            sector: sector,
            deficitTrigger: deficitTrigger,
            emotionalTag: emotionalTag,
            restorationAction: restorationAction,
            timestamp: block.timestamp
        });
        emit GapClauseActivated(id, sector, emotionalTag);
    }

    function getGapClause(uint256 id) external view returns (GapClause memory) {
        return clauses[id];
    }
}
