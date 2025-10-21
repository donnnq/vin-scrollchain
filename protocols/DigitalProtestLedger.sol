// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalProtestLedger {
    address public admin;

    struct ProtestEntry {
        string platform;
        string protestType; // "Hashtag Storm", "Livestream Rally", "Comment Section Audit"
        string ledgerClause;
        string emotionalTag;
        bool summoned;
        bool logged;
        bool sealed;
    }

    ProtestEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProtest(string memory platform, string memory protestType, string memory ledgerClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtestEntry(platform, protestType, ledgerClause, emotionalTag, true, false, false));
    }

    function confirmLogging(uint256 index) external onlyAdmin {
        entries[index].logged = true;
    }

    function sealProtestEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getProtestEntry(uint256 index) external view returns (ProtestEntry memory) {
        return entries[index];
    }
}
