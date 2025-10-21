// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostBudgetKarmaDAO {
    address public admin;

    struct BudgetEntry {
        string projectName;
        uint256 allocatedAmount;
        string ghostType; // "Untraceable", "Unimplemented", "Paper-Only"
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    BudgetEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBudgetAudit(string memory projectName, uint256 allocatedAmount, string memory ghostType, string memory emotionalTag) external onlyAdmin {
        entries.push(BudgetEntry(projectName, allocatedAmount, ghostType, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealBudgetEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getBudgetEntry(uint256 index) external view returns (BudgetEntry memory) {
        return entries[index];
    }
}
