// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JudicialConsequenceDAO {
    address public admin;

    struct ConsequenceEntry {
        string actorName;
        string infraction;
        string emotionalTag;
        bool summoned;
        bool resolved;
    }

    ConsequenceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonConsequence(string memory actorName, string memory infraction, string memory emotionalTag) external onlyAdmin {
        entries.push(ConsequenceEntry(actorName, infraction, emotionalTag, true, false));
    }

    function resolveConsequence(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getConsequence(uint256 index) external view returns (ConsequenceEntry memory) {
        return entries[index];
    }
}
