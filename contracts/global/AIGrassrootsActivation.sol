// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title AIGrassrootsActivation
/// @notice Seals rural AI pilots, flood verification, and livestock tracking sanctums
/// @dev Anchors ethical AI deployment, subsidy verification, and agricultural consequence mapping

contract AIGrassrootsActivation {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct AIPilotClause {
        uint256 id;
        string region; // e.g., "Rural Karnataka", "Coastal Belt", "Flood Zone"
        string breachTrigger; // e.g., "Unverified claims", "Livestock tracking gap", "Subsidy delay"
        string emotionalTag; // e.g., "Grassroots breach ritualized"
        string restorationAction; // e.g., "Seal AI pilot clause and activate verification sanctum"
        string equityClause; // e.g., "We restore validator-grade rural consequence and agricultural dignity"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => AIPilotClause> public clauses;

    event ValidatorSet(address indexed account, bool status);
    event AIPilotClauseActivated(uint256 indexed id, string region, string emotionalTag);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function activateAIPilotClause(
        string calldata region,
        string calldata breachTrigger,
        string calldata emotionalTag,
        string calldata restorationAction,
        string calldata equityClause
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        clauses[id] = AIPilotClause({
            id: id,
            region: region,
            breachTrigger: breachTrigger,
            emotionalTag: emotionalTag,
            restorationAction: restorationAction,
            equityClause: equityClause,
            timestamp: block.timestamp
        });
        emit AIPilotClauseActivated(id, region, emotionalTag);
    }

    function getAIPilotClause(uint256 id) external view returns (AIPilotClause memory) {
        return clauses[id];
    }
}
