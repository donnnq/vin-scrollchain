// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CannabisPublicHealthLedgerProtocol {
    address public admin;

    struct LedgerEntry {
        string region;
        string healthMetric;
        string reformImpact;
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

    function summonLedger(string memory region, string memory healthMetric, string memory reformImpact, string memory emotionalTag) external onlyAdmin {
        entries.push(LedgerEntry(region, healthMetric, reformImpact, emotionalTag, true, false, false));
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
