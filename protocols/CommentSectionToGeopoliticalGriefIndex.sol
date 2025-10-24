// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommentSectionToGeopoliticalGriefIndex {
    address public steward;

    struct GriefEntry {
        string commentSignal; // "Navalny and Nemtsov won't witness Putin’s downfall"
        string griefType; // "Martyr remembrance", "Justice longing"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    GriefEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexGrief(string memory commentSignal, string memory griefType, string memory emotionalTag) external onlySteward {
        entries.push(GriefEntry(commentSignal, griefType, emotionalTag, true, false));
    }

    function sealGriefEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getGriefEntry(uint256 index) external view returns (GriefEntry memory) {
        return entries[index];
    }
}
