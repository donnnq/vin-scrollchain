// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EvidenceResurrectionDAO {
    address public admin;

    struct ResurrectionEntry {
        string agency; // "DPWH"
        string incident; // "Fire at compound"
        string recoveryMethod; // "Cloud backup", "Offsite archive", "Witness affidavit"
        string emotionalTag;
        bool resurrected;
        bool sealed;
    }

    ResurrectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function resurrectEvidence(string memory agency, string memory incident, string memory recoveryMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(ResurrectionEntry(agency, incident, recoveryMethod, emotionalTag, true, false));
    }

    function sealResurrectionEntry(uint256 index) external onlyAdmin {
        require(entries[index].resurrected, "Must be resurrected first");
        entries[index].sealed = true;
    }

    function getResurrectionEntry(uint256 index) external view returns (ResurrectionEntry memory) {
        return entries[index];
    }
}
