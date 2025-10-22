// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NarrativeBreadcrumbContainmentGrid {
    address public steward;

    struct BreadcrumbEntry {
        string hintType; // "Psychic breach", "Energy shield", "Time capsule sync"
        string breadcrumbSignal; // "Emotional anchor", "Symbolic misdirection", "Unverifiable mythos"
        string emotionalTag;
        bool contained;
        bool sealed;
    }

    BreadcrumbEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function containBreadcrumb(string memory hintType, string memory breadcrumbSignal, string memory emotionalTag) external onlySteward {
        entries.push(BreadcrumbEntry(hintType, breadcrumbSignal, emotionalTag, true, false));
    }

    function sealBreadcrumbEntry(uint256 index) external onlySteward {
        require(entries[index].contained, "Must be contained first");
        entries[index].sealed = true;
    }

    function getBreadcrumbEntry(uint256 index) external view returns (BreadcrumbEntry memory) {
        return entries[index];
    }
}
