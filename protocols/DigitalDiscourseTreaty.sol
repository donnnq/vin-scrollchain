// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalDiscourseTreaty {
    address public steward;

    struct DiscourseClause {
        string platform;
        string discourseModel;
        string moderationSafeguard;
        string emotionalTag;
    }

    DiscourseClause[] public treatyLog;

    event DigitalDiscourseTagged(string platform, string discourseModel, string moderationSafeguard, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDiscourse(
        string memory platform,
        string memory discourseModel,
        string memory moderationSafeguard,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(DiscourseClause(platform, discourseModel, moderationSafeguard, emotionalTag));
        emit DigitalDiscourseTagged(platform, discourseModel, moderationSafeguard, emotionalTag);
    }
}
