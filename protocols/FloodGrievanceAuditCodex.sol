// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodGrievanceAuditCodex {
    address public steward;

    struct GrievanceEntry {
        string barangay;
        string floodZone;
        string grievanceDetail;
        string proposedSolution;
        string emotionalTag;
    }

    GrievanceEntry[] public codex;

    event FloodGrievanceTagged(string barangay, string floodZone, string grievanceDetail, string proposedSolution, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagGrievance(
        string memory barangay,
        string memory floodZone,
        string memory grievanceDetail,
        string memory proposedSolution,
        string memory emotionalTag
    ) public onlySteard {
        codex.push(GrievanceEntry(barangay, floodZone, grievanceDetail, proposedSolution, emotionalTag));
        emit FloodGrievanceTagged(barangay, floodZone, grievanceDetail, proposedSolution, emotionalTag);
    }
}
