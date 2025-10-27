// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayToBroadcastIntegrationGrid {
    address public steward;

    struct BroadcastEntry {
        string barangay; // "Brgy. Muzon, Brgy. Malainen Bago"
        string clause; // "Scrollchain-sealed grid for housing news rotation, purok-level outreach, and civic consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    BroadcastEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexBroadcast(string memory barangay, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(barangay, clause, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
