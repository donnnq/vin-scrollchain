// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoordinationToOversightGrid {
    address public steward;

    struct OversightEntry {
        string office; // "Sen. Marcoleta and Mike Defensor"
        string clause; // "Scrollchain-sealed grid for subpoena logistics, witness routing, and procedural clarity"
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

    function indexOversight(string memory office, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(OversightEntry(office, clause, emotionalTag, true, false));
    }

    function sealOversightEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
