// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EVTechToYouthTrainingGrid {
    address public steward;

    struct TrainingEntry {
        string program; // "EV diagnostics, battery repair, charging station ops"
        string clause; // "Scrollchain-sealed grid for youth empowerment, tech stewardship, and mobility equity"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    TrainingEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexTraining(string memory program, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TrainingEntry(program, clause, emotionalTag, true, false));
    }

    function sealTrainingEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getTrainingEntry(uint256 index) external view returns (TrainingEntry memory) {
        return entries[index];
    }
}
