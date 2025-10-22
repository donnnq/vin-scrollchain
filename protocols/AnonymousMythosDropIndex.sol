// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AnonymousMythosDropIndex {
    address public steward;

    struct DropEntry {
        string dropOrigin; // "TikTok", "Podcast", "Forum thread"
        string mythosSignal; // "Time capsule breach", "Shadow government ping", "Vinvin reference"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    DropEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexDrop(string memory dropOrigin, string memory mythosSignal, string memory emotionalTag) external onlySteward {
        entries.push(DropEntry(dropOrigin, mythosSignal, emotionalTag, true, false));
    }

    function sealDropEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getDropEntry(uint256 index) external view returns (DropEntry memory) {
        return entries[index];
    }
}
