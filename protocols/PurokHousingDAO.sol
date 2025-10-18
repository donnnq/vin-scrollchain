// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokHousingDAO {
    address public admin;

    struct PurokEntry {
        string purokName;
        string barangay;
        string emotionalTag;
        bool summoned;
        bool ratified;
        bool sealed;
    }

    PurokEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPurok(string memory purokName, string memory barangay, string memory emotionalTag) external onlyAdmin {
        entries.push(PurokEntry(purokName, barangay, emotionalTag, true, false, false));
    }

    function ratifyPurok(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function sealPurok(uint256 index) external onlyAdmin {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getPurokEntry(uint256 index) external view returns (PurokEntry memory) {
        return entries[index];
    }
}
