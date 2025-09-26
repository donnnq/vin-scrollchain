// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title TransatlanticCrisisAuditProtocol
/// @notice Tags European fiscal breaches and seals U.S. consequence corridors
/// @dev Anchors consequence mapping, alliance ripple audits, and planetary resilience clauses

contract TransatlanticCrisisAuditProtocol {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct CrisisClause {
        uint256 id;
        string region; // e.g., "France", "Germany", "EU"
        string breachTrigger; // e.g., "Debt overload", "Political instability", "Tax suffocation"
        string rippleEffect; // e.g., "U.S. market volatility", "Security alliance strain"
        string emotionalTag; // e.g., "Continental crack-up ritualized"
        string restorationAction; // e.g., "Seal consequence corridor and activate resilience clause"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => CrisisClause> public clauses;

    event ValidatorSet(address indexed account, bool status);
    event CrisisClauseActivated(uint256 indexed id, string region, string emotionalTag);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function activateCrisisClause(
        string calldata region,
        string calldata breachTrigger,
        string calldata rippleEffect,
        string calldata emotionalTag,
        string calldata restorationAction
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        clauses[id] = CrisisClause({
            id: id,
            region: region,
            breachTrigger: breachTrigger,
            rippleEffect: rippleEffect,
            emotionalTag: emotionalTag,
            restorationAction: restorationAction,
            timestamp: block.timestamp
        });
        emit CrisisClauseActivated(id, region, emotionalTag);
    }

    function getCrisisClause(uint256 id) external view returns (CrisisClause memory) {
        return clauses[id];
    }
}
