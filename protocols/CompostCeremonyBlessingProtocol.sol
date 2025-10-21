// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CompostCeremonyBlessingProtocol {
    address public admin;

    struct CeremonyEntry {
        string barangay;
        string compostSource; // "Vegetable Waste", "Manure", "Crop Residue"
        string blessingLayer; // "Youth Invocation", "Ancestral Chant", "Seed Offering"
        string emotionalTag;
        bool summoned;
        bool blessed;
        bool sealed;
    }

    CeremonyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCeremony(string memory barangay, string memory compostSource, string memory blessingLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(CeremonyEntry(barangay, compostSource, blessingLayer, emotionalTag, true, false, false));
    }

    function confirmBlessing(uint256 index) external onlyAdmin {
        entries[index].blessed = true;
    }

    function sealCeremonyEntry(uint256 index) external onlyAdmin {
        require(entries[index].blessed, "Must be blessed first");
        entries[index].sealed = true;
    }

    function getCeremonyEntry(uint256 index) external view returns (CeremonyEntry memory) {
        return entries[index];
    }
}
