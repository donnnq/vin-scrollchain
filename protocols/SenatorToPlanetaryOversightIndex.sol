// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenatorToPlanetaryOversightIndex {
    address public steward;

    struct OversightEntry {
        string senatorName; // "Raffy Tulfo"
        string oversightAction; // "Surprise inspections, budget threats, legislative push"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    OversightEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexOversight(string memory senatorName, string memory oversightAction, string memory emotionalTag) external onlySteward {
        entries.push(OversightEntry(senatorName, oversightAction, emotionalTag, true, false));
    }

    function sealOversightEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
