// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RecipeToUNESCOHeritageProtocol {
    address public steward;

    struct HeritageEntry {
        string recipeName; // "QuantumPainX Formula"
        string originCulture; // "Filipino"
        string preservationMethod; // "Scrollchain-sealed, emotionally tagged, UNESCO petitioned"
        string emotionalTag;
        bool archived;
        bool sealed;
    }

    HeritageEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function archiveRecipe(string memory recipeName, string memory originCulture, string memory preservationMethod, string memory emotionalTag) external onlySteward {
        entries.push(HeritageEntry(recipeName, originCulture, preservationMethod, emotionalTag, true, false));
    }

    function sealHeritageEntry(uint256 index) external onlySteward {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getHeritageEntry(uint256 index) external view returns (HeritageEntry memory) {
        return entries[index];
    }
}
