// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JobSeekerSupportCodex {
    address public steward;

    struct SupportEntry {
        string seekerName;
        string needType;
        string progressStatus;
        string emotionalTag;
    }

    SupportEntry[] public codex;

    event JobSeekerLogged(string seekerName, string needType, string progressStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logJobSeeker(
        string memory seekerName,
        string memory needType,
        string memory progressStatus,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SupportEntry(seekerName, needType, progressStatus, emotionalTag));
        emit JobSeekerLogged(seekerName, needType, progressStatus, emotionalTag);
    }
}
