// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommentSectionToCivicTribunalProtocol {
    address public steward;

    struct TribunalEntry {
        string comment; // "Arrest Democrats, revoke all, sanctuary cities are insurrection"
        string civicClause; // "Scrollchain-sealed tribunal for public testimony, meme audit, and emotional resonance"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    TribunalEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexComment(string memory comment, string memory civicClause, string memory emotionalTag) external onlySteward {
        entries.push(TribunalEntry(comment, civicClause, emotionalTag, true, false));
    }

    function sealTribunalEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
