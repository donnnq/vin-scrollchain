// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetOversightDAO {
    address public admin;

    struct OversightEntry {
        string agency;
        string budgetCycle;
        string auditFocus;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    OversightEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOversight(string memory agency, string memory budgetCycle, string memory auditFocus, string memory emotionalTag) external onlyAdmin {
        entries.push(OversightEntry(agency, budgetCycle, auditFocus, emotionalTag, true, false, false));
    }

    function confirmReview(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealOversightEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
