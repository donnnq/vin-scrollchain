// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StartupToMentorshipGrid {
    address public steward;

    struct MentorshipEntry {
        string startup; // "Tech Row, Youth Pod"
        string clause; // "Scrollchain-sealed grid for mentorship access, founder guidance, and civic startup equity"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    MentorshipEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexMentorship(string memory startup, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(MentorshipEntry(startup, clause, emotionalTag, true, false));
    }

    function sealMentorshipEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getMentorshipEntry(uint256 index) external view returns (MentorshipEntry memory) {
        return entries[index];
    }
}
