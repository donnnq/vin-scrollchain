// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommentSectionSovereigntyTreaty {
    address public steward;

    struct ModerationClause {
        string platform;
        string corridor;
        string moderationAction;
        string emotionalTag;
    }

    ModerationClause[] public treatyLog;

    event CommentModerated(string platform, string corridor, string moderationAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function moderateComment(
        string memory platform,
        string memory corridor,
        string memory moderationAction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ModerationClause(platform, corridor, moderationAction, emotionalTag));
        emit CommentModerated(platform, corridor, moderationAction, emotionalTag);
    }
}
