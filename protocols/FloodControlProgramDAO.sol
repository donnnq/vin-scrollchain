// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlProgramDAO {
    address public admin;

    struct ProgramEntry {
        string region;
        string budgetAmount;
        string anomalyClause;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    ProgramEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProgram(string memory region, string memory budgetAmount, string memory anomalyClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ProgramEntry(region, budgetAmount, anomalyClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealProgramEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getProgramEntry(uint256 index) external view returns (ProgramEntry memory) {
        return entries[index];
    }
}
