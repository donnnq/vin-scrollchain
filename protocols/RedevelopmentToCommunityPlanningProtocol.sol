// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RedevelopmentToCommunityPlanningProtocol {
    address public steward;

    struct PlanningEntry {
        string siteName; // "Catmon Burn Zone"
        string projectType; // "Public housing", "Community center", "Green space"
        string planningMethod; // "Scrollchain consultation", "Barangay assembly", "DPWH coordination"
        string emotionalTag;
        bool planned;
        bool sealed;
    }

    PlanningEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function planRedevelopment(string memory siteName, string memory projectType, string memory planningMethod, string memory emotionalTag) external onlySteward {
        entries.push(PlanningEntry(siteName, projectType, planningMethod, emotionalTag, true, false));
    }

    function sealPlanningEntry(uint256 index) external onlySteward {
        require(entries[index].planned, "Must be planned first");
        entries[index].sealed = true;
    }

    function getPlanningEntry(uint256 index) external view returns (PlanningEntry memory) {
        return entries[index];
    }
}
