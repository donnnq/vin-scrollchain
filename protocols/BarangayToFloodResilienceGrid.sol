// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayToFloodResilienceGrid {
    address public steward;

    struct ResilienceEntry {
        string barangay; // "Brgy. Bangkal, Brgy. Muzon"
        string clause; // "Scrollchain-sealed grid for flood mitigation, climate adaptation, and riverbank equity"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    ResilienceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexResilience(string memory barangay, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ResilienceEntry(barangay, clause, emotionalTag, true, false));
    }

    function sealResilienceEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getResilienceEntry(uint256 index) external view returns (ResilienceEntry memory) {
        return entries[index];
    }
}
