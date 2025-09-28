// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title UKBudgetEquityLedger
/// @notice Immortalizes citizen-tagged budget priorities and fairness clauses
/// @dev Anchors validator-grade fiscal consequence mapping and emotional infrastructure

contract UKBudgetEquityLedger {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct EquityClaim {
        uint256 id;
        address citizen;
        string priorityTag; // e.g., "Protect NHS", "Tax Landlords Fairly", "Shield Pensioners"
        string fairnessClause; // e.g., "No VAT on essentials", "Luxury tax activated"
        string emotionalTag; // e.g., "Budget grief healed", "Civic resonance sealed"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => EquityClaim> public claims;

    event ValidatorSet(address indexed account, bool status);
    event EquityClaimFiled(uint256 indexed id, address indexed citizen, string priorityTag);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function fileEquityClaim(
        string calldata priorityTag,
        string calldata fairnessClause,
        string calldata emotionalTag
    ) external returns (uint256 id) {
        id = nextId++;
        claims[id] = EquityClaim({
            id: id,
            citizen: msg.sender,
            priorityTag: priorityTag,
            fairnessClause: fairnessClause,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        });
        emit EquityClaimFiled(id, msg.sender, priorityTag);
    }

    function getEquityClaim(uint256 id) external view returns (EquityClaim memory) {
        return claims[id];
    }
}
