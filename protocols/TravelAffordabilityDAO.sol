// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TravelAffordabilityDAO {
    address public admin;

    struct TravelEntry {
        string travelType;
        string costImpact;
        string affordabilityClause;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    TravelEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory travelType, string memory costImpact, string memory affordabilityClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TravelEntry(travelType, costImpact, affordabilityClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealTravelEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getTravelEntry(uint256 index) external view returns (TravelEntry memory) {
        return entries[index];
    }
}
