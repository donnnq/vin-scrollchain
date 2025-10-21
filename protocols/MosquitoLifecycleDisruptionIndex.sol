// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MosquitoLifecycleDisruptionIndex {
    address public admin;

    struct DisruptionEntry {
        string species; // "Aedes aegypti", "Aedes albopictus"
        string disruptionLayer; // "Larval Kill", "Egg Site Removal", "Adult Fogging"
        string purokZone;
        string emotionalTag;
        bool summoned;
        bool disrupted;
        bool sealed;
    }

    DisruptionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDisruption(string memory species, string memory disruptionLayer, string memory purokZone, string memory emotionalTag) external onlyAdmin {
        entries.push(DisruptionEntry(species, disruptionLayer, purokZone, emotionalTag, true, false, false));
    }

    function confirmDisruption(uint256 index) external onlyAdmin {
        entries[index].disrupted = true;
    }

    function sealDisruptionEntry(uint256 index) external onlyAdmin {
        require(entries[index].disrupted, "Must be disrupted first");
        entries[index].sealed = true;
    }

    function getDisruptionEntry(uint256 index) external view returns (DisruptionEntry memory) {
        return entries[index];
    }
}
