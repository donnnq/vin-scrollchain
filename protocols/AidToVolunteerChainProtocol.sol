// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AidToVolunteerChainProtocol {
    address public steward;

    struct VolunteerEntry {
        string aidType; // "Food packs", "Water", "Medical kits", "Clothing", "Cash assistance"
        string volunteerGroup; // "Catmon Youth", "Barangay Watch", "Scrollchain Relief Corps"
        string deliveryMethod; // "Door-to-door", "Evac center drop", "Scrollchain log"
        string emotionalTag;
        bool delivered;
        bool sealed;
    }

    VolunteerEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logDelivery(string memory aidType, string memory volunteerGroup, string memory deliveryMethod, string memory emotionalTag) external onlySteward {
        entries.push(VolunteerEntry(aidType, volunteerGroup, deliveryMethod, emotionalTag, true, false));
    }

    function sealVolunteerEntry(uint256 index) external onlySteward {
        require(entries[index].delivered, "Must be delivered first");
        entries[index].sealed = true;
    }

    function getVolunteerEntry(uint256 index) external view returns (VolunteerEntry memory) {
        return entries[index];
    }
}
