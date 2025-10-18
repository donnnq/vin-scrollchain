// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FlatMicroIncomeTaxDAO {
    address public admin;

    struct IncomeEntry {
        string earnerName;
        uint256 annualIncome;
        string emotionalTag;
        bool summoned;
        bool capped;
        bool sealed;
    }

    IncomeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonIncome(string memory earnerName, uint256 annualIncome, string memory emotionalTag) external onlyAdmin {
        entries.push(IncomeEntry(earnerName, annualIncome, emotionalTag, true, false, false));
    }

    function capTax(uint256 index) external onlyAdmin {
        entries[index].capped = true;
    }

    function sealMicroTax(uint256 index) external onlyAdmin {
        require(entries[index].capped, "Must be capped first");
        entries[index].sealed = true;
    }

    function getIncomeEntry(uint256 index) external view returns (IncomeEntry memory) {
        return entries[index];
    }
}
