// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InstitutionalLoyaltyRiskGrid {
    address public admin;

    struct LoyaltyEntry {
        string agency;
        string riskType; // "Political Insertion", "Espionage", "Influence Planting"
        string gridClause;
        string emotionalTag;
        bool summoned;
        bool scored;
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

    function summonLoyaltyRisk(string memory agency, string memory riskType, string memory gridClause, string memory emotionalTag) external onlyAdmin {
        entries.push(LoyaltyEntry(agency, riskType, gridClause, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealLoyaltyEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getLoyaltyEntry(uint256 index) external view returns (LoyaltyEntry memory) {
        return entries[index];
    }
}
