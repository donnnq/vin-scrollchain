// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinScrollSpectator — Ritual-grade audience scroll for reactions and scoring
contract vinScrollSpectator {
    enum ReactionType { Praise, Roast, Confusion, Awe }

    struct Reaction {
        ReactionType reactionType;
        string comment;
        address reactor;
        uint256 timestamp;
    }

    struct Vote {
        uint8 score;
        address voter;
    }

    mapping(address => Reaction[]) public reactions;
    mapping(address => Vote[]) public votes;

    event ReactionLogged(address indexed scroll, ReactionType reactionType, string comment, address reactor);
    event VoteLogged(address indexed scroll, uint8 score, address voter);

    function reactToScroll(address scroll, ReactionType reactionType, string memory comment) external {
        reactions[scroll].push(Reaction({
            reactionType: reactionType,
            comment: comment,
            reactor: msg.sender,
            timestamp: block.timestamp
        }));
        emit ReactionLogged(scroll, reactionType, comment, msg.sender);
    }

    function voteOnScroll(address scroll, uint8 score) external {
        require(score <= 10, "Max score is 10");
        votes[scroll].push(Vote(score, msg.sender));
        emit VoteLogged(scroll, score, msg.sender);
    }

    function getAverageScore(address scroll) external view returns (uint256) {
        uint256 total;
        uint256 count = votes[scroll].length;
        for (uint i = 0; i < count; i++) {
            total += votes[scroll][i].score;
        }
        return count > 0 ? total / count : 0;
    }

    function getRoastRatio(address scroll) external view returns (uint256 roastPercent) {
        uint256 roastCount;
        uint256 total = reactions[scroll].length;
        for (uint i = 0; i < total; i++) {
            if (reactions[scroll][i].reactionType == ReactionType.Roast) roastCount++;
        }
        roastPercent = total > 0 ? (roastCount * 100) / total : 0;
    }
}
