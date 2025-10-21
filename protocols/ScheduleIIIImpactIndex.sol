// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScheduleIIIImpactIndex {
    address public admin;

    struct ImpactEntry {
        string sector; // "Cannabis", "Healthcare", "Retail"
        string impactType; // "Tax Relief", "Banking Access", "Legal Clarity"
        string delayStatus; // "Pending", "Stalled", "Unclear"
        string emotionalTag;
        bool summoned;
        bool scored;
        bool sealed;
    }

    ImpactEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonImpact(string memory sector, string memory impactType, string memory delayStatus, string memory emotionalTag) external onlyAdmin {
        entries.push(ImpactEntry(sector, impactType, delayStatus, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealImpactEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getImpactEntry(uint256 index) external view returns (ImpactEntry memory) {
        return entries[index];
    }
}
