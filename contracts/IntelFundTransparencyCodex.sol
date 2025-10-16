// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntelFundTransparencyCodex {
    address public admin;

    struct FundEntry {
        string departmentLabel;
        uint256 amount;
        string emotionalTag;
        bool disclosed;
        bool audited;
    }

    FundEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitFund(string memory departmentLabel, uint256 amount, string memory emotionalTag) external onlyAdmin {
        entries.push(FundEntry(departmentLabel, amount, emotionalTag, false, false));
    }

    function discloseFund(uint256 index) external onlyAdmin {
        entries[index].disclosed = true;
    }

    function auditFund(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function getFund(uint256 index) external view returns (FundEntry memory) {
        return entries[index];
    }
}
