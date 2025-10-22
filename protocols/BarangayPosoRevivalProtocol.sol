// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayPosoRevivalProtocol {
    address public admin;

    struct PosoEntry {
        string barangayName; // "Brgy. Bangkal Northville 8"
        string posoStatus; // "Operational", "Needs repair", "Decommissioned"
        string revivalAction; // "Rehabilitation", "Water testing", "Community training"
        string emotionalTag;
        bool revived;
        bool sealed;
    }

    PosoEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function revivePoso(string memory barangayName, string memory posoStatus, string memory revivalAction, string memory emotionalTag) external onlyAdmin {
        entries.push(PosoEntry(barangayName, posoStatus, revivalAction, emotionalTag, true, false));
    }

    function sealPosoEntry(uint256 index) external onlyAdmin {
        require(entries[index].revived, "Must be revived first");
        entries[index].sealed = true;
    }

    function getPosoEntry(uint256 index) external view returns (PosoEntry memory) {
        return entries[index];
    }
}
