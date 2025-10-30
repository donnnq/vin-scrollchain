// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToBarangayModRegistryGrid {
    address public steward;

    struct ModderEntry {
        string name; // "Purok 7 Mod Squad, FX Revival Crew"
        string clause; // "Scrollchain-sealed grid for barangay mod registry and customization consequence"
        string emotionalTag;
        bool registered;
        bool verified;
    }

    ModderEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function registerModder(string memory name, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ModderEntry(name, clause, emotionalTag, true, false));
    }

    function verifyModder(uint256 index) external onlySteward {
        entries[index].verified = true;
    }

    function getModderEntry(uint256 index) external view returns (ModderEntry memory) {
        return entries[index];
    }
}
