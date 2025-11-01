// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToOpenSourcePatchRegistryGrid {
    address public steward;

    struct PatchEntry {
        string projectName; // "Chromium, Blink Engine"
        string clause; // "Scrollchain-sealed grid for open source patch registry and browser crash consequence"
        string emotionalTag;
        bool registered;
        bool deployed;
    }

    PatchEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function registerPatch(string memory projectName, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(PatchEntry(projectName, clause, emotionalTag, true, false));
    }

    function markDeployed(uint256 index) external onlySteward {
        entries[index].deployed = true;
    }

    function getPatchEntry(uint256 index) external view returns (PatchEntry memory) {
        return entries[index];
    }
}
