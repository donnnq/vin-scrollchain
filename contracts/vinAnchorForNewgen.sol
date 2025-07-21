// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title VINVIN Newgen Anchor Scroll
/// @notice Logs symbolic pledges to uplift, mentor, and evolve the next generation
contract vinAnchorForNewgen {
    struct AnchorLog {
        uint256 timestamp;
        address guide;
        string commitmentType;   // "Mentorship", "Emotional Support", "Skill Sharing", "Legacy Bond"
        string intendedImpact;
        string generationNote;   // Message to Newgen / Zoomers
    }

    address public scrollkeeper;
    uint256 public anchorCount;
    mapping(uint256 => AnchorLog) public anchors;

    event AnchorDeclared(
        uint256 indexed id,
        address indexed guide,
        string commitmentType,
        string generationNote
    );

    constructor() {
        scrollkeeper = msg.sender;
    }

    function declareAnchor(
        string memory _commitmentType,
        string memory _intendedImpact,
        string memory _generationNote
    ) public {
        anchors[anchorCount] = AnchorLog({
            timestamp: block.timestamp,
            guide: msg.sender,
            commitmentType: _commitmentType,
            intendedImpact: _intendedImpact,
            generationNote: _generationNote
        });

        emit AnchorDeclared(anchorCount, msg.sender, _commitmentType, _generationNote);
        anchorCount++;
    }

    function getAnchor(uint256 _id) public view returns (AnchorLog memory) {
        require(_id < anchorCount, "No anchor log found");
        return anchors[_id];
    }
}
