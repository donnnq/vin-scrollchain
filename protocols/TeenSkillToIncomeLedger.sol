// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TeenSkillToIncomeLedger {
    address public steward;

    struct IncomeEntry {
        string teenName;
        string skillType; // "Digital art", "Crafts", "Coding", "Food prep"
        uint256 monthlyEarnings;
        string emotionalTag;
        bool verified;
        bool sealed;
    }

    IncomeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logIncome(string memory teenName, string memory skillType, uint256 monthlyEarnings, string memory emotionalTag) external onlySteward {
        entries.push(IncomeEntry(teenName, skillType, monthlyEarnings, emotionalTag, true, false));
    }

    function sealIncomeEntry(uint256 index) external onlySteward {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getIncomeEntry(uint256 index) external view returns (IncomeEntry memory) {
        return entries[index];
    }
}
