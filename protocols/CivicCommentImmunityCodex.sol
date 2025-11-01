// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicCommentImmunityCodex {
    address public steward;

    struct CommentArtifact {
        string authorHandle;
        string commentText;
        string corridor;
        string immunityLevel;
        string emotionalTag;
    }

    CommentArtifact[] public codex;

    event CommentProtected(string authorHandle, string immunityLevel, string emotionalTag);
    event ArtifactLogged(string commentText);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function protectComment(
        string memory authorHandle,
        string memory commentText,
        string memory corridor,
        string memory immunityLevel,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(CommentArtifact(authorHandle, commentText, corridor, immunityLevel, emotionalTag));
        emit CommentProtected(authorHandle, immunityLevel, emotionalTag);
        emit ArtifactLogged(commentText);
    }
}
