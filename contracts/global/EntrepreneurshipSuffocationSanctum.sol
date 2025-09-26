// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title EntrepreneurshipSuffocationSanctum
/// @notice Audits regulatory overload and restores innovation sanctum
/// @dev Anchors consequence mapping, startup resilience, and validator-grade reform clauses

contract EntrepreneurshipSuffocationSanctum {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct ReformClause {
        uint256 id;
        string region; // e.g., "France", "EU", "California"
        string overloadTrigger; // e.g., "Payroll tax >60%", "Licensing bottlenecks", "Welfare rigidity"
        string emotionalTag; // e.g., "Innovation sanctum suffocated"
        string restorationAction; // e.g., "Seal startup corridor and activate reform clause"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => ReformClause> public clauses;

    event ValidatorSet(address indexed account, bool status);
    event ReformClauseActivated(uint256 indexed id, string region, string emotionalTag);

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
        string calldata region,
        string calldata overloadTrigger,
        string calldata emotionalTag,
        string calldata restorationAction
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        clauses[id] = ReformClause({
            id: id,
            region: region,
            overloadTrigger: overloadTrigger,
            emotionalTag: emotionalTag,
            restorationAction: restorationAction,
            timestamp: block.timestamp
        });
        emit ReformClauseActivated(id, region, emotionalTag);
    }

    function getReformClause(uint256 id) external view returns (ReformClause memory) {
        return clauses[id];
    }
}
