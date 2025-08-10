// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ForgivenessChamber - Ritual scroll for civic redemption and public healing votes
/// @author Vinvin
/// @notice Allows nullified figures to submit for forgiveness and tracks public resonance

contract ForgivenessChamber {
    address public scrollsmith;

    struct Submission {
        string name;
        string country;
        string confession;
        uint256 supportVotes;
        uint256 rejectVotes;
        bool isResolved;
        bool isForgiven;
        uint256 timestamp;
    }

    Submission[] public submissions;
    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event SubmissionEntered(string name, string confession, uint256 timestamp);
    event VoteCast(uint256 submissionId, address voter, bool support);
    event ResolutionFinalized(uint256 submissionId, bool isForgiven);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Submit a confession for forgiveness
    function submitForgiveness(string calldata name, string calldata country, string calldata confession) external onlyScrollsmith {
        submissions.push(Submission(name, country, confession, 0, 0, false, false, block.timestamp));
        emit SubmissionEntered(name, confession, block.timestamp);
    }

    /// @notice Cast a vote (support or reject)
    function vote(uint256 submissionId, bool support) external {
        require(submissionId < submissions.length, "Invalid ID");
        require(!hasVoted[submissionId][msg.sender], "Already voted");
        require(!submissions[submissionId].isResolved, "Already resolved");

        hasVoted[submissionId][msg.sender] = true;

        if (support) {
            submissions[submissionId].supportVotes += 1;
        } else {
            submissions[submissionId].rejectVotes += 1;
        }

        emit VoteCast(submissionId, msg.sender, support);
    }

    /// @notice Finalize resolution based on votes
    function finalizeResolution(uint256 submissionId) external onlyScrollsmith {
        require(submissionId < submissions.length, "Invalid ID");
        Submission storage s = submissions[submissionId];
        require(!s.isResolved, "Already resolved");

        s.isResolved = true;
        s.isForgiven = s.supportVotes > s.rejectVotes;

        emit ResolutionFinalized(submissionId, s.isForgiven);
    }

    /// @notice View all submissions
    function getAllSubmissions() external view returns (Submission[] memory) {
        return submissions;
    }
}
