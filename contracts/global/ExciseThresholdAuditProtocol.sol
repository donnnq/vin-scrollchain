// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title ExciseThresholdAuditProtocol
/// @notice Simulates excise tax impact across cannabis operator tiers
/// @dev Anchors equity calibration, fiscal consequence mapping, and validator-grade relief clauses

contract ExciseThresholdAuditProtocol {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct TaxImpactClause {
        uint256 id;
        string operatorTier; // e.g., "Micro", "Mid-size", "Enterprise"
        uint256 oldRate;
        uint256 newRate;
        string emotionalTag; // e.g., "Excise relief ritualized"
        string equityClause; // e.g., "We restore breathing room for distressed operators"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => TaxImpactClause> public clauses;

    event ValidatorSet(address indexed account, bool status);
    event TaxImpactClauseActivated(uint256 indexed id, string operatorTier, string emotionalTag);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function activateTaxImpactClause(
        string calldata operatorTier,
        uint256 oldRate,
        uint256 newRate,
        string calldata emotionalTag,
        string calldata equityClause
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        clauses[id] = TaxImpactClause({
            id: id,
            operatorTier: operatorTier,
            oldRate: oldRate,
            newRate: newRate,
            emotionalTag: emotionalTag,
            equityClause: equityClause,
            timestamp: block.timestamp
        });
        emit TaxImpactClauseActivated(id, operatorTier, emotionalTag);
    }

    function getTaxImpactClause(uint256 id) external view returns (TaxImpactClause memory) {
        return clauses[id];
    }
}
