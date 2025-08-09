// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ScrollSession - Ritual module for logging legislative sessions as civic glyphs with emotional metrics
/// @author Vinvin
/// @notice Archives bills, joy scores, and lambing impact per session

contract ScrollSession {
    address public scrollsmith;

    struct Session {
        string title;
        string billSummary;
        uint256 joyScore;
        uint256 dignityScore;
        uint256 timestamp;
        bool lambingApproved;
    }

    Session[] public sessions;

    event SessionLogged(string title, uint256 joyScore, bool lambingApproved);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Log a legislative session
    function logSession(
        string calldata title,
        string calldata billSummary,
        uint256 joyScore,
        uint256 dignityScore,
        bool lambingApproved
    ) external onlyScrollsmith {
        sessions.push(Session(
            title,
            billSummary,
            joyScore,
            dignityScore,
            block.timestamp,
            lambingApproved
        ));

        emit SessionLogged(title, joyScore, lambingApproved);
    }

    /// @notice View all sessions
    function getAllSessions() external view returns (Session[] memory) {
        return sessions;
    }
}
