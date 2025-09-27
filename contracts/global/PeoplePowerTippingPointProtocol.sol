// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title PeoplePowerTippingPointProtocol
/// @notice Tags civic unrest thresholds and seals democratic restoration sanctums
/// @dev Anchors validator-grade consequence mapping for mass mobilization, institutional breach, and emotional infrastructure

contract PeoplePowerTippingPointProtocol {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct TippingClause {
        uint256 id;
        string triggerEvent; // e.g., "Flood Control Scandal", "Judicial Paralysis", "Youth Mobilization"
        string emotionalTag; // e.g., "People Power threshold ritualized"
        string restorationAction; // e.g., "Seal democratic sanctum and activate civic trust clause"
        string equityClause; // e.g., "We restore validator-grade consequence across public governance corridors"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => TippingClause> public clauses;

    event ValidatorSet(address indexed account, bool status);
    event TippingClauseActivated(uint256 indexed id, string triggerEvent, string emotionalTag);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function activateTippingClause(
        string calldata triggerEvent,
        string calldata emotionalTag,
        string calldata restorationAction,
        string calldata equityClause
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        clauses[id] = TippingClause({
            id: id,
            triggerEvent: triggerEvent,
            emotionalTag: emotionalTag,
            restorationAction: restorationAction,
            equityClause: equityClause,
            timestamp: block.timestamp
        });
        emit TippingClauseActivated(id, triggerEvent, emotionalTag);
    }

    function getTippingClause(uint256 id) external view returns (TippingClause memory) {
        return clauses[id];
    }
}
