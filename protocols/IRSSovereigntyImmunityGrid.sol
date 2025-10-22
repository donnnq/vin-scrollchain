// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IRSSovereigntyImmunityGrid {
    address public admin;

    struct ImmunityEntry {
        string entityName; // "Open Society Foundations"
        string threatSource; // "IRS", "Trump Treasury"
        string immunityType; // "Tax-exempt protection", "Political neutrality"
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

    function declareImmunity(string memory entityName, string memory threatSource, string memory immunityType, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(entityName, threatSource, immunityType, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].immune, "Must be immune first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
