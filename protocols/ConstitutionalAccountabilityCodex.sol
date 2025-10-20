// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstitutionalAccountabilityCodex {
    address public admin;

    struct AccountabilityEntry {
        string officialName;
        string officeTitle;
        string accountabilityClause;
        string emotionalTag;
        bool summoned;
        bool validated;
        bool sealed;
    }

    AccountabilityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAccountability(string memory officialName, string memory officeTitle, string memory accountabilityClause, string memory emotionalTag) external onlyAdmin {
        entries.push(AccountabilityEntry(officialName, officeTitle, accountabilityClause, emotionalTag, true, false, false));
    }

    function confirmValidation(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function sealAccountabilityEntry(uint256 index) external onlyAdmin {
        require(entries[index].validated, "Must be validated first");
        entries[index].sealed = true;
    }

    function getAccountabilityEntry(uint256 index) external view returns (AccountabilityEntry memory) {
        return entries[index];
    }
}
