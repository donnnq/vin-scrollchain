// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FamilyOf3LivelihoodActivationIndex {
    address public steward;

    struct LivelihoodEntry {
        string familyRole; // "Housewife", "Solo earner", "Teen child"
        string livelihoodType; // "Online selling", "Community gardening", "Crafts", "Remote work"
        string emotionalTag;
        bool activated;
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

    function activateLivelihood(string memory familyRole, string memory livelihoodType, string memory emotionalTag) external onlySteward {
        entries.push(LivelihoodEntry(familyRole, livelihoodType, emotionalTag, true, false));
    }

    function sealLivelihoodEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getLivelihoodEntry(uint256 index) external view returns (LivelihoodEntry memory) {
        return entries[index];
    }
}
