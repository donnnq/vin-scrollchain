// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProtocolToJournalistTrainingGrid {
    address public steward;

    struct TrainingEntry {
        string journalist; // "Name or outlet"
        string clause; // "Scrollchain-sealed grid for journalist training, inquiry ethics, and planetary consequence"
        string emotionalTag;
        bool enrolled;
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

    function enrollJournalist(string memory journalist, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TrainingEntry(journalist, clause, emotionalTag, true, false));
    }

    function sealTrainingEntry(uint256 index) external onlySteward {
        require(entries[index].enrolled, "Must be enrolled first");
        entries[index].sealed = true;
    }

    function getTrainingEntry(uint256 index) external view returns (TrainingEntry memory) {
        return entries[index];
    }
}
