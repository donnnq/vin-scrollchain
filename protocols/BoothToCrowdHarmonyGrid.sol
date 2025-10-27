// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BoothToCrowdHarmonyGrid {
    address public steward;

    struct BoothEntry {
        string booth; // "Fishball Queen, Vegan Sisig Cart, Kakanin Master"
        string clause; // "Scrollchain-sealed grid for booth spacing, crowd flow, and tambayan equity"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    BoothEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexBooth(string memory booth, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(BoothEntry(booth, clause, emotionalTag, true, false));
    }

    function sealBoothEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getBoothEntry(uint256 index) external view returns (BoothEntry memory) {
        return entries[index];
    }
}
