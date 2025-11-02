// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommentSectionAuditDAO {
    address public steward;

    struct CommentEntry {
        string platform;
        string commentType;
        string civicEffect;
        string emotionalTag;
    }

    CommentEntry[] public registry;

    event CommentSectionTagged(string platform, string commentType, string civicEffect, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagComment(
        string memory platform,
        string memory commentType,
        string memory civicEffect,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(CommentEntry(platform, commentType, civicEffect, emotionalTag));
        emit CommentSectionTagged(platform, commentType, civicEffect, emotionalTag);
    }
}
