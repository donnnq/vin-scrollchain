// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HousewifeLivelihoodRegistry {
    address public steward;

    struct LivelihoodEntry {
        string name;
        string livelihoodType; // "Online selling", "Cooking", "Laundry service", "Crafts"
        string emotionalTag;
        bool registered;
        bool sealed;
    }

    LivelihoodEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function registerLivelihood(string memory name, string memory livelihoodType, string memory emotionalTag) external onlySteward {
        entries.push(LivelihoodEntry(name, livelihoodType, emotionalTag, true, false));
    }

    function sealLivelihoodEntry(uint256 index) external onlySteward {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getLivelihoodEntry(uint256 index) external view returns (LivelihoodEntry memory) {
        return entries[index];
    }
}
