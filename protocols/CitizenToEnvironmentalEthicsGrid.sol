// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CitizenToEnvironmentalEthicsGrid {
    address public steward;

    struct EthicsEntry {
        string citizenSector; // "Mechanics, truckers, regulators"
        string ethicsClause; // "Balance between environmental protection and livelihood dignity"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    EthicsEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateEthics(string memory citizenSector, string memory ethicsClause, string memory emotionalTag) external onlySteward {
        entries.push(EthicsEntry(citizenSector, ethicsClause, emotionalTag, true, false));
    }

    function sealEthicsEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
