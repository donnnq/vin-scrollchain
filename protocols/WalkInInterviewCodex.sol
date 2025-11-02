// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WalkInInterviewCodex {
    address public steward;

    struct InterviewClause {
        string barangay;
        string recruiterName;
        string interviewSlot;
        string emotionalTag;
    }

    InterviewClause[] public codex;

    event WalkInInterviewLogged(string barangay, string recruiterName, string interviewSlot, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logWalkInInterview(
        string memory barangay,
        string memory recruiterName,
        string memory interviewSlot,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(InterviewClause(barangay, recruiterName, interviewSlot, emotionalTag));
        emit WalkInInterviewLogged(barangay, recruiterName, interviewSlot, emotionalTag);
    }
}
