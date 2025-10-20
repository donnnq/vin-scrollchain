// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DefenseLoyaltyCodex {
    address public admin;

    struct LoyaltyEntry {
        string officerName;
        string commandZone;
        string loyaltyClause;
        string emotionalTag;
        bool summoned;
        bool audited;
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

    function summonLoyaltyAudit(string memory officerName, string memory commandZone, string memory loyaltyClause, string memory emotionalTag) external onlyAdmin {
        entries.push(LoyaltyEntry(officerName, commandZone, loyaltyClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealLoyaltyEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getLoyaltyEntry(uint256 index) external view returns (LoyaltyEntry memory) {
        return entries[index];
    }
}
