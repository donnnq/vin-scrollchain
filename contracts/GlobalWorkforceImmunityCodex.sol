// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalWorkforceImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string companyName;
        string laborConcern;
        string emotionalTag;
        bool flagged;
        bool immunized;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function flagConcern(string memory companyName, string memory laborConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(companyName, laborConcern, emotionalTag, true, false));
    }

    function immunizeCompany(uint256 index) external onlyAdmin {
        entries[index].immunized = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
