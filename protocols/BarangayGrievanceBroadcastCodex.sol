// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayGrievanceBroadcastCodex {
    address public steward;

    struct GrievanceEntry {
        string barangay;
        string issueType;
        string communitySentiment;
        string emotionalTag;
    }

    GrievanceEntry[] public codex;

    event GrievanceBroadcasted(string barangay, string issueType, string communitySentiment, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastGrievance(
        string memory barangay,
        string memory issueType,
        string memory communitySentiment,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(GrievanceEntry(barangay, issueType, communitySentiment, emotionalTag));
        emit GrievanceBroadcasted(barangay, issueType, communitySentiment, emotionalTag);
    }
}
