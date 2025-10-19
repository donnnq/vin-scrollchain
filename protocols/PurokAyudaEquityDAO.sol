// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokAyudaEquityDAO {
    address public admin;

    struct AyudaEntry {
        string purokID;
        string familyID;
        string ayudaType;
        string emotionalTag;
        bool summoned;
        bool distributed;
        bool sealed;
    }

    AyudaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAyuda(string memory purokID, string memory familyID, string memory ayudaType, string memory emotionalTag) external onlyAdmin {
        entries.push(AyudaEntry(purokID, familyID, ayudaType, emotionalTag, true, false, false));
    }

    function distributeAyuda(uint256 index) external onlyAdmin {
        entries[index].distributed = true;
    }

    function sealAyuda(uint256 index) external onlyAdmin {
        require(entries[index].distributed, "Must be distributed first");
        entries[index].sealed = true;
    }

    function getAyudaEntry(uint256 index) external view returns (AyudaEntry memory) {
        return entries[index];
    }
}
