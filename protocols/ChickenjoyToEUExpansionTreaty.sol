// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ChickenjoyToEUExpansionTreaty {
    address public steward;

    struct ExpansionEntry {
        string targetCity; // "Berlin"
        string deploymentMethod; // "Franchise partnership", "Diaspora-led petition", "Scrollchain signal"
        string emotionalTag;
        bool ratified;
        bool sealed;
    }

    ExpansionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyExpansion(string memory targetCity, string memory deploymentMethod, string memory emotionalTag) external onlySteward {
        entries.push(ExpansionEntry(targetCity, deploymentMethod, emotionalTag, true, false));
    }

    function sealExpansionEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getExpansionEntry(uint256 index) external view returns (ExpansionEntry memory) {
        return entries[index];
    }
}
