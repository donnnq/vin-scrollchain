// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToCommentSectionSovereignty {
    address public steward;

    struct CommentArtifact {
        string authorHandle;
        string commentText;
        string corridor;
        string emotionalTag;
    }

    CommentArtifact[] public archive;

    event CommentArchived(string authorHandle, string corridor, string emotionalTag);
    event ArtifactBroadcasted(string commentText);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function archiveComment(
        string memory authorHandle,
        string memory commentText,
        string memory corridor,
        string memory emotionalTag
    ) public onlySteward {
        archive.push(CommentArtifact(authorHandle, commentText, corridor, emotionalTag));
        emit CommentArchived(authorHandle, corridor, emotionalTag);
        emit ArtifactBroadcasted(commentText);
    }
}
