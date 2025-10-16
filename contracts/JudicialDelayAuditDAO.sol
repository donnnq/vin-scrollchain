// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JudicialDelayAuditDAO {
    address public admin;

    struct DelayEntry {
        string caseLabel;
        string delayCause;
        string emotionalTag;
        bool flagged;
        bool resolved;
    }

    DelayEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitDelay(string memory caseLabel, string memory delayCause, string memory emotionalTag) external onlyAdmin {
        entries.push(DelayEntry(caseLabel, delayCause, emotionalTag, true, false));
    }

    function resolveDelay(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getDelay(uint256 index) external view returns (DelayEntry memory) {
        return entries[index];
    }
}
