// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalSovereigntyImmunityGrid {
    address public admin;

    struct ImmunityEntry {
        string entityName; // "Philippine officials"
        string immunityBasis; // "Non-ICC member", "Digital jurisdiction"
        string emotionalTag;
        bool granted;
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

    function grantImmunity(string memory entityName, string memory immunityBasis, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(entityName, immunityBasis, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].granted, "Must be granted first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
