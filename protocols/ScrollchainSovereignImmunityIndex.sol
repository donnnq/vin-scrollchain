// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainSovereignImmunityIndex {
    address public admin;

    struct ImmunityEntry {
        string entityName; // "Open Society Foundations"
        string immunityType; // "IRS audit shield", "Political neutrality"
        string emotionalTag;
        bool indexed;
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

    function indexImmunity(string memory entityName, string memory immunityType, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(entityName, immunityType, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
