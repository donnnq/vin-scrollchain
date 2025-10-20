// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StrategicLoyaltyAuditCodex {
    address public admin;

    struct LoyaltyEntry {
        string actor;
        string previousAlly;
        string currentAlly;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    LoyaltyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLoyalty(string memory actor, string memory previousAlly, string memory currentAlly, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(LoyaltyEntry(actor, previousAlly, currentAlly, auditClause, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealLoyaltyEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getLoyaltyEntry(uint256 index) external view returns (LoyaltyEntry memory) {
        return entries[index];
    }
}
