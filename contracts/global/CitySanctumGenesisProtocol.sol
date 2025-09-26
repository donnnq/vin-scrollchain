// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title CitySanctumGenesisProtocol
/// @notice Ritualizes infrastructure, talent, and investment clause activation for emerging tech sanctums
/// @dev Anchors startup migration, builder sanctum formation, and regional tech equity

contract CitySanctumGenesisProtocol {
    address public steward;
    mapping(address => bool) public validators;

    modifier onlySteward() { require(msg.sender == steward, "Not steward"); _; }
    modifier onlyValidator() { require(validators[msg.sender] || msg.sender == steward, "Not validator"); _; }

    struct GenesisClause {
        uint256 id;
        string city; // e.g., "Mysuru", "Mangaluru", "Hubballi-Dharwad"
        string breachTrigger; // e.g., "Infrastructure lag", "Talent drain", "Investment gap"
        string emotionalTag; // e.g., "Sanctum breach ritualized"
        string restorationAction; // e.g., "Activate tech park clause and seal startup migration corridor"
        string equityClause; // e.g., "We restore validator-grade city genesis and regional tech consequence"
        uint256 timestamp;
    }

    uint256 public nextId = 1;
    mapping(uint256 => GenesisClause> public clauses;

    event ValidatorSet(address indexed account, bool status);
    event GenesisClauseActivated(uint256 indexed id, string city, string emotionalTag);

    constructor() {
        steward = msg.sender;
        validators[msg.sender] = true;
        emit ValidatorSet(msg.sender, true);
    }

    function setValidator(address account, bool status) external onlySteward {
        validators[account] = status;
        emit ValidatorSet(account, status);
    }

    function activateGenesisClause(
        string calldata city,
        string calldata breachTrigger,
        string calldata emotionalTag,
        string calldata restorationAction,
        string calldata equityClause
    ) external onlyValidator returns (uint256 id) {
        id = nextId++;
        clauses[id] = GenesisClause({
            id: id,
            city: city,
            breachTrigger: breachTrigger,
            emotionalTag: emotionalTag,
            restorationAction: restorationAction,
            equityClause: equityClause,
            timestamp: block.timestamp
        });
        emit GenesisClauseActivated(id, city, emotionalTag);
    }

    function getGenesisClause(uint256 id) external view returns (GenesisClause memory) {
        return clauses[id];
    }
}
