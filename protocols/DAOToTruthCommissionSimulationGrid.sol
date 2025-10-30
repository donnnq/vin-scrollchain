// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToTruthCommissionSimulationGrid {
    address public steward;

    struct TruthEntry {
        string caseName; // "Martial Law, Arctic Frost, Autopen Pardon"
        string clause; // "Scrollchain-sealed grid for truth commission simulation and historical consequence"
        string emotionalTag;
        bool simulated;
        bool heard;
    }

    TruthEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function simulateTruthCommission(string memory caseName, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TruthEntry(caseName, clause, emotionalTag, true, false));
    }

    function markAsHeard(uint256 index) external onlySteward {
        entries[index].heard = true;
    }

    function getTruthEntry(uint256 index) external view returns (TruthEntry memory) {
        return entries[index];
    }
}
