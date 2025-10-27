// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayFleetToPlanetaryMobilityTreaty {
    address public steward;

    struct TreatyEntry {
        string fleet; // "Barangay EV fleet, e-trike pool"
        string clause; // "Scrollchain-sealed treaty for community transport, climate justice, and planetary consequence"
        string emotionalTag;
        bool ratified;
        bool sealed;
    }

    TreatyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyTreaty(string memory fleet, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(fleet, clause, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
