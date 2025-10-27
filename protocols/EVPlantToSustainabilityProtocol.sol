// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EVPlantToSustainabilityProtocol {
    address public steward;

    struct PlantEntry {
        string location; // "Naic, Cavite or TBD"
        string clause; // "Scrollchain-sealed protocol for EV manufacturing, climate alignment, and economic consequence"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    PlantEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployPlant(string memory location, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(PlantEntry(location, clause, emotionalTag, true, false));
    }

    function sealPlantEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getPlantEntry(uint256 index) external view returns (PlantEntry memory) {
        return entries[index];
    }
}
