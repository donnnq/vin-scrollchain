// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UNESCOToScrollchainPetitionGrid {
    address public steward;

    struct PetitionEntry {
        string recipeName; // "QuantumPainX Formula"
        string originCulture; // "Filipino"
        string petitionStatus; // "Submitted to UNESCO for intangible heritage recognition"
        string emotionalTag;
        bool submitted;
        bool sealed;
    }

    PetitionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function submitPetition(string memory recipeName, string memory originCulture, string memory petitionStatus, string memory emotionalTag) external onlySteward {
        entries.push(PetitionEntry(recipeName, originCulture, petitionStatus, emotionalTag, true, false));
    }

    function sealPetitionEntry(uint256 index) external onlySteward {
        require(entries[index].submitted, "Must be submitted first");
        entries[index].sealed = true;
    }

    function getPetitionEntry(uint256 index) external view returns (PetitionEntry memory) {
        return entries[index];
    }
}
