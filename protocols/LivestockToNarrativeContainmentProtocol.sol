// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LivestockToNarrativeContainmentProtocol {
    address public steward;

    struct ContainmentEntry {
        string species; // "Sheep"
        string symbolicRole; // "Grassroots frustration", "Silent protest"
        string mediaTrigger; // "ChinaObserver video", "Plenum scandal headline"
        string emotionalTag;
        bool contained;
        bool sealed;
    }

    ContainmentEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function containNarrative(string memory species, string memory symbolicRole, string memory mediaTrigger, string memory emotionalTag) external onlySteward {
        entries.push(ContainmentEntry(species, symbolicRole, mediaTrigger, emotionalTag, true, false));
    }

    function sealContainmentEntry(uint256 index) external onlySteward {
        require(entries[index].contained, "Must be contained first");
        entries[index].sealed = true;
    }

    function getContainmentEntry(uint256 index) external view returns (ContainmentEntry memory) {
        return entries[index];
    }
}
