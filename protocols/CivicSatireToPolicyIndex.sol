// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DOJConflictImmunityProtocol {
    address public steward;

    struct ConflictEntry {
        string officialName;
        string priorAffiliation; // "Trump legal team", "Political donor", etc.
        string currentRole;
        string emotionalTag;
        bool flagged;
        bool sealed;
    }

    ConflictEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function flagConflict(string memory officialName, string memory priorAffiliation, string memory currentRole, string memory emotionalTag) external onlySteward {
        entries.push(ConflictEntry(officialName, priorAffiliation, currentRole, emotionalTag, true, false));
    }

    function sealConflictEntry(uint256 index) external onlySteward {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].sealed = true;
    }

    function getConflictEntry(uint256 index) external view returns (ConflictEntry memory) {
        return entries[index];
    }
}
