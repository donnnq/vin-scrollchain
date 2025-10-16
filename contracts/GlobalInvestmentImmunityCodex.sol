// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalInvestmentImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string investorLabel;
        string protectionClause;
        string emotionalTag;
        bool granted;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory investorLabel, string memory protectionClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(investorLabel, protectionClause, emotionalTag, false));
    }

    function grantEntry(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
