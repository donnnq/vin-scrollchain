// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BalancedHiringMandateCodex {
    address public admin;

    struct HiringBalanceEntry {
        string companyName;
        uint256 localPercentage;
        uint256 foreignPercentage;
        string emotionalTag;
        bool summoned;
        bool compliant;
    }

    HiringBalanceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonHiringBalance(string memory companyName, uint256 localPercentage, uint256 foreignPercentage, string memory emotionalTag) external onlyAdmin {
        entries.push(HiringBalanceEntry(companyName, localPercentage, foreignPercentage, emotionalTag, true, false));
    }

    function markCompliant(uint256 index) external onlyAdmin {
        entries[index].compliant = true;
    }

    function getHiringBalanceEntry(uint256 index) external view returns (HiringBalanceEntry memory) {
        return entries[index];
    }
}
