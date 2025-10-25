// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EquityToAncestralRemedyGrid {
    address public steward;

    struct RemedyEntry {
        string region; // "Diaspora zone", "Purok registry", "Scrollchain corridor"
        string remedyType; // "Cannabis", "Herbal medicine", "Traditional healing"
        string equitySignal; // "Health dignity", "Ancestral access", "Scrollchain immunity"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    RemedyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexRemedy(string memory region, string memory remedyType, string memory equitySignal, string memory emotionalTag) external onlySteward {
        entries.push(RemedyEntry(region, remedyType, equitySignal, emotionalTag, true, false));
    }

    function sealRemedyEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getRemedyEntry(uint256 index) external view returns (RemedyEntry memory) {
        return entries[index];
    }
}
