// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalCivicInfrastructureLedger {
    address public admin;

    struct LedgerEntry {
        string country;
        string projectName;
        string ledgerType; // "Verified", "Ghost", "Restored"
        string emotionalTag;
        bool summoned;
        bool logged;
        bool sealed;
    }

    LedgerEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLedgerEntry(string memory country, string memory projectName, string memory ledgerType, string memory emotionalTag) external onlyAdmin {
        entries.push(LedgerEntry(country, projectName, ledgerType, emotionalTag, true, false, false));
    }

    function confirmLogging(uint256 index) external onlyAdmin {
        entries[index].logged = true;
    }

    function sealLedgerEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getLedgerEntry(uint256 index) external view returns (LedgerEntry memory) {
        return entries[index];
    }
}
