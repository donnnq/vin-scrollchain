// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollCodex {
    struct Entry {
        string term;
        string category; // e.g. "Sigil", "Relic", "Avatar", "Scroll", "Role"
        string meaning;
        string origin;
        uint256 timestamp;
    }

    Entry[] public entries;
    address public immutable codexKeeper;

    event EntryAdded(string term, string category, string meaning, string origin, uint256 indexed id);

    modifier onlyKeeper() {
        require(msg.sender == codexKeeper, "Not the codex keeper");
        _;
    }

    constructor() {
        codexKeeper = msg.sender;
    }

    function addEntry(
        string calldata term,
        string calldata category,
        string calldata meaning,
        string calldata origin
    ) external onlyKeeper {
        entries.push(Entry({
            term: term,
            category: category,
            meaning: meaning,
            origin: origin,
            timestamp: block.timestamp
        }));

        emit EntryAdded(term, category, meaning, origin, entries.length - 1);
    }

    function getEntry(uint256 id) external view returns (Entry memory) {
        require(id < entries.length, "Invalid entry ID");
        return entries[id];
    }

    function totalEntries() external view returns (uint256) {
        return entries.length;
    }
}
