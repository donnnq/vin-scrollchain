// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MeritocracyInvestmentCodex {
    address public admin;

    struct InvestmentEntry {
        string companyName;
        string hiringPolicy;
        string emotionalTag;
        bool evaluated;
        bool approved;
    }

    InvestmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function evaluateCompany(string memory companyName, string memory hiringPolicy, string memory emotionalTag) external onlyAdmin {
        entries.push(InvestmentEntry(companyName, hiringPolicy, emotionalTag, true, false));
    }

    function approveInvestment(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function getInvestment(uint256 index) external view returns (InvestmentEntry memory) {
        return entries[index];
    }
}
