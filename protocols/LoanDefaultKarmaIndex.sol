// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LoanDefaultKarmaIndex {
    address public admin;

    struct DefaultEntry {
        string institution;
        string assetClass; // "Real Estate", "Consumer", "Corporate"
        string defaultTrigger; // "Rate Spike", "Valuation Drop", "Fraud"
        string emotionalTag;
        bool summoned;
        bool scored;
        bool sealed;
    }

    DefaultEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDefault(string memory institution, string memory assetClass, string memory defaultTrigger, string memory emotionalTag) external onlyAdmin {
        entries.push(DefaultEntry(institution, assetClass, defaultTrigger, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealDefaultEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getDefaultEntry(uint256 index) external view returns (DefaultEntry memory) {
        return entries[index];
    }
}
