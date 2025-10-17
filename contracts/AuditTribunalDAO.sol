// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string actorName;
        string auditConcern;
        string emotionalTag;
        bool summoned;
        bool resolved;
    }

    TribunalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTribunal(string memory actorName, string memory auditConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(actorName, auditConcern, emotionalTag, true, false));
    }

    function resolveTribunal(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getTribunal(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
