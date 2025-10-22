// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicWorksRestorationGrid {
    address public admin;

    struct RestorationEntry {
        string agency; // "DPWH"
        string damagedAsset; // "Compound", "Archives", "Equipment"
        string restorationMethod; // "Reconstruction", "Digital recovery", "Emergency funding"
        string emotionalTag;
        bool restored;
        bool sealed;
    }

    RestorationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function restorePublicWorks(string memory agency, string memory damagedAsset, string memory restorationMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(RestorationEntry(agency, damagedAsset, restorationMethod, emotionalTag, true, false));
    }

    function sealRestorationEntry(uint256 index) external onlyAdmin {
        require(entries[index].restored, "Must be restored first");
        entries[index].sealed = true;
    }

    function getRestorationEntry(uint256 index) external view returns (RestorationEntry memory) {
        return entries[index];
    }
}
