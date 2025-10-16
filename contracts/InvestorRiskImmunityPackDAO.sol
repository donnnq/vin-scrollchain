// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvestorRiskImmunityPackDAO {
    address public admin;

    struct ImmunityEntry {
        string investorLabel;
        string immunityClause;
        string emotionalTag;
        bool granted;
    }

    ImmunityEntry[] public immunity;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _investorLabel, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        immunity.push(ImmunityEntry(_investorLabel, _immunityClause, _emotionalTag, false));
    }

    function grantEntry(uint256 index) external onlyAdmin {
        immunity[index].granted = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return immunity[index];
    }
}
