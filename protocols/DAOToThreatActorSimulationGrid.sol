// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToThreatActorSimulationGrid {
    address public steward;

    struct ThreatEntry {
        string actor; // "UNC6512"
        string clause; // "Scrollchain-sealed grid for threat actor simulation and exploit consequence"
        string emotionalTag;
        bool simulated;
        bool profiled;
    }

    ThreatEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function simulateThreatActor(string memory actor, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ThreatEntry(actor, clause, emotionalTag, true, false));
    }

    function confirmProfile(uint256 index) external onlySteward {
        entries[index].profiled = true;
    }

    function getThreatEntry(uint256 index) external view returns (ThreatEntry memory) {
        return entries[index];
    }
}
