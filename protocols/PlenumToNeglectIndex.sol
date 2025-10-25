// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlenumToNeglectIndex {
    address public steward;

    struct NeglectEntry {
        string plenumEvent; // "Fourth Plenary"
        string governanceFailure; // "Ignored rural infrastructure", "Suppressed dissent"
        string symbolicEcho; // "Sheep protest", "Public satire"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    NeglectEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexNeglect(string memory plenumEvent, string memory governanceFailure, string memory symbolicEcho, string memory emotionalTag) external onlySteward {
        entries.push(NeglectEntry(plenumEvent, governanceFailure, symbolicEcho, emotionalTag, true, false));
    }

    function sealNeglectEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getNeglectEntry(uint256 index) external view returns (NeglectEntry memory) {
        return entries[index];
    }
}
