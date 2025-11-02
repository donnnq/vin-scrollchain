// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicCommentKarmaMuseum {
    address public steward;

    struct ExhibitEntry {
        string platform;
        string commentTheme;
        string karmaVerdict;
        string emotionalTag;
    }

    ExhibitEntry[] public registry;

    event CommentArchived(string platform, string commentTheme, string karmaVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function archiveComment(
        string memory platform,
        string memory commentTheme,
        string memory karmaVerdict,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ExhibitEntry(platform, commentTheme, karmaVerdict, emotionalTag));
        emit CommentArchived(platform, commentTheme, karmaVerdict, emotionalTag);
    }
}
