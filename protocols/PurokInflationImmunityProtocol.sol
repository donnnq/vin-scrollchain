// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokInflationImmunityProtocol {
    address public admin;

    struct ImmunityEntry {
        string purokID;
        string inflationThreat;
        string supportType;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonImmunity(string memory purokID, string memory inflationThreat, string memory supportType, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(purokID, inflationThreat, supportType, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealImmunity(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
