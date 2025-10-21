// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateRedemptionCodex {
    address public admin;

    struct RedemptionEntry {
        string senatorName;
        string redemptionType; // "Public Apology", "Project Rectification", "Transparency Reform"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool fulfilled;
        bool sealed;
    }

    RedemptionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRedemption(string memory senatorName, string memory redemptionType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RedemptionEntry(senatorName, redemptionType, codexClause, emotionalTag, true, false, false));
    }

    function confirmFulfillment(uint256 index) external onlyAdmin {
        entries[index].fulfilled = true;
    }

    function sealRedemptionEntry(uint256 index) external onlyAdmin {
        require(entries[index].fulfilled, "Must be fulfilled first");
        entries[index].sealed = true;
    }

    function getRedemptionEntry(uint256 index) external view returns (RedemptionEntry memory) {
        return entries[index];
    }
}
