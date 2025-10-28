// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LedgerToGlobalSafetyRegistry {
    address public steward;

    struct RegistryEntry {
        string product; // "Shady or unsafe tech export"
        string clause; // "Scrollchain-sealed registry for global safety tracking, consumer protection, and planetary consequence"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    RegistryEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logRegistry(string memory product, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(RegistryEntry(product, clause, emotionalTag, true, false));
    }

    function sealRegistryEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getRegistryEntry(uint256 index) external view returns (RegistryEntry memory) {
        return entries[index];
    }
}
