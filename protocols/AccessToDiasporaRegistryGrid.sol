// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccessToDiasporaRegistryGrid {
    address public steward;

    struct RegistryEntry {
        string medicineName; // "QuantumPainX"
        string diasporaRegion; // "North America"
        string accessLevel; // "Full access with cultural credit"
        string emotionalTag;
        bool registered;
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

    function registerAccess(string memory medicineName, string memory diasporaRegion, string memory accessLevel, string memory emotionalTag) external onlySteward {
        entries.push(RegistryEntry(medicineName, diasporaRegion, accessLevel, emotionalTag, true, false));
    }

    function sealRegistryEntry(uint256 index) external onlySteward {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getRegistryEntry(uint256 index) external view returns (RegistryEntry memory) {
        return entries[index];
    }
}
