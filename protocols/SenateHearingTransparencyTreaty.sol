// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateHearingTransparencyTreaty {
    address public steward;

    struct TreatyClause {
        string hearingTitle;
        string participantName;
        string transparencyProtocol;
        string emotionalTag;
    }

    TreatyClause[] public treatyLog;

    event SenateHearingTransparencyTagged(string hearingTitle, string participantName, string transparencyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTransparency(
        string memory hearingTitle,
        string memory participantName,
        string memory transparencyProtocol,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(TreatyClause(hearingTitle, participantName, transparencyProtocol, emotionalTag));
        emit SenateHearingTransparencyTagged(hearingTitle, participantName, transparencyProtocol, emotionalTag);
    }
}
