// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FireAidToImmediateReliefGrid {
    address public steward;

    struct AidEntry {
        string familyID; // "Catmon-Family-001"
        string aidType; // "Food packs", "Water", "Medical", "Clothing", "Cash assistance"
        string deliveryMethod; // "LGU drop", "Volunteer chain", "Scrollchain log"
        string emotionalTag;
        bool delivered;
        bool sealed;
    }

    AidEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deliverAid(string memory familyID, string memory aidType, string memory deliveryMethod, string memory emotionalTag) external onlySteward {
        entries.push(AidEntry(familyID, aidType, deliveryMethod, emotionalTag, true, false));
    }

    function sealAidEntry(uint256 index) external onlySteward {
        require(entries[index].delivered, "Must be delivered first");
        entries[index].sealed = true;
    }

    function getAidEntry(uint256 index) external view returns (AidEntry memory) {
        return entries[index];
    }
}
