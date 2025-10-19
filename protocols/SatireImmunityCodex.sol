// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SatireImmunityCodex {
    address public admin;

    struct SatireEntry {
        string creatorName;
        string satireType;
        string immunityClause;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    SatireEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSatire(string memory creatorName, string memory satireType, string memory immunityClause, string memory emotionalTag) external onlyAdmin {
        entries.push(SatireEntry(creatorName, satireType, immunityClause, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealSatireEntry(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getSatireEntry(uint256 index) external view returns (SatireEntry memory) {
        return entries[index];
    }
}
