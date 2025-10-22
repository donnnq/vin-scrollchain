// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICCJurisdictionImmunityRegistry {
    address public admin;

    struct ImmunityEntry {
        string individualName; // "Sen. Bato", "FPRRD"
        string jurisdictionStatus; // "Non-member state", "Under review"
        string emotionalTag;
        bool immune;
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

    function declareImmunity(string memory individualName, string memory jurisdictionStatus, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(individualName, jurisdictionStatus, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].immune, "Must be immune first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
