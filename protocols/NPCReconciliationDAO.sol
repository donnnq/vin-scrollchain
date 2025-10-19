// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NPCReconciliationDAO {
    address public admin;

    struct ReconciliationEntry {
        string entityName;
        string issueType;
        string resolutionPath;
        string emotionalTag;
        bool summoned;
        bool reconciled;
        bool sealed;
    }

    ReconciliationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReconciliation(string memory entityName, string memory issueType, string memory resolutionPath, string memory emotionalTag) external onlyAdmin {
        entries.push(ReconciliationEntry(entityName, issueType, resolutionPath, emotionalTag, true, false, false));
    }

    function confirmReconciliation(uint256 index) external onlyAdmin {
        entries[index].reconciled = true;
    }

    function sealReconciliationEntry(uint256 index) external onlyAdmin {
        require(entries[index].reconciled, "Must be reconciled first");
        entries[index].sealed = true;
    }

    function getReconciliationEntry(uint256 index) external view returns (ReconciliationEntry memory) {
        return entries[index];
    }
}
