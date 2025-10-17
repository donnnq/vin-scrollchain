// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PresidentialSecurityLedger {
    address public admin;

    struct SecurityEntry {
        string threatLevel;
        string protectiveAction;
        string emotionalTag;
        bool logged;
        bool neutralized;
    }

    SecurityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logThreat(string memory threatLevel, string memory protectiveAction, string memory emotionalTag) external onlyAdmin {
        entries.push(SecurityEntry(threatLevel, protectiveAction, emotionalTag, true, false));
    }

    function neutralizeThreat(uint256 index) external onlyAdmin {
        entries[index].neutralized = true;
    }

    function getSecurityEntry(uint256 index) external view returns (SecurityEntry memory) {
        return entries[index];
    }
}
