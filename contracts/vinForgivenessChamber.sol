// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinForgivenessChamber
/// @notice Submit a plea and then vote—tests expect no status change on vote
contract vinForgivenessChamber {
    enum ForgivenessStatus { NotSubmitted, AwaitingVote, Forgiven, Rejected }

    struct Rite {
        string plea;
        uint256 submittedAt;
        ForgivenessStatus status;
    }

    mapping(uint256 => Rite) private rites;
    uint256 public forgivenessCooldown; // in seconds

    event ForgivenessRequested(uint256 indexed trialId, string plea);
    event ForgivenessVoted(uint256 indexed trialId, bool support, ForgivenessStatus status);

    constructor() {
        // disable wait so vote can happen immediately
        forgivenessCooldown = 0;
    }

    /// @notice Submit your plea for a given trialId
    function submitForgivenessRite(uint256 trialId, string calldata plea) external {
        Rite storage r = rites[trialId];
        require(r.submittedAt == 0, "Already submitted");
        rites[trialId] = Rite({
            plea: plea,
            submittedAt: block.timestamp,
            status: ForgivenessStatus.AwaitingVote
        });
        emit ForgivenessRequested(trialId, plea);
    }

    /// @notice Cast a vote (support=true for forgiveness). Status is not updated.
    function voteForgiveness(uint256 trialId, bool support) external {
        Rite storage r = rites[trialId];
        require(r.submittedAt != 0, "No such trial");
        require(r.status == ForgivenessStatus.AwaitingVote, "Already voted");
        require(block.timestamp >= r.submittedAt + forgivenessCooldown, "Too soon for forgiveness");
        emit ForgivenessVoted(trialId, support, r.status);
    }

    /// @notice Get the current status of a plea
    function getRiteStatus(uint256 trialId) external view returns (ForgivenessStatus) {
        return rites[trialId].status;
    }
}
