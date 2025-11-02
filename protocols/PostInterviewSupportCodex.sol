// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PostInterviewSupportCodex {
    address public steward;

    struct SupportClause {
        string seekerName;
        string supportType;
        string followUpStatus;
        string emotionalTag;
    }

    SupportClause[] public codex;

    event PostInterviewSupportLogged(string seekerName, string supportType, string followUpStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logPostInterviewSupport(
        string memory seekerName,
        string memory supportType,
        string memory followUpStatus,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SupportClause(seekerName, supportType, followUpStatus, emotionalTag));
        emit PostInterviewSupportLogged(seekerName, supportType, followUpStatus, emotionalTag);
    }
}
