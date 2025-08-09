// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ScrollVote - Civic ritual module for barangay-level voting on upgrades and soulbound proposals
/// @author Vinvin
/// @notice Enables decentralized decision-making with dignity and style

contract ScrollVote {
    address public scrollsmith;

    struct Proposal {
        string title;
        string description;
        uint256 deadline;
        uint256 yesVotes;
        uint256 noVotes;
        bool executed;
        mapping(address => bool) hasVoted;
    }

    uint256 public proposalCount;
    mapping(uint256 => Proposal) private proposals;
    mapping(address => bool) public authorizedVoters;

    event ProposalCreated(uint256 indexed proposalId, string title, uint256 deadline);
    event Voted(uint256 indexed proposalId, address voter, bool vote);
    event ProposalExecuted(uint256 indexed proposalId, bool passed);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    modifier onlyAuthorized() {
        require(authorizedVoters[msg.sender], "Not authorized to vote");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Authorize a soulbound voter
    function authorizeVoter(address voter) external onlyScrollsmith {
        authorizedVoters[voter] = true;
    }

    /// @notice Create a new civic proposal
    function createProposal(
        string calldata title,
        string calldata description,
        uint256 durationInSeconds
    ) external onlyScrollsmith {
        Proposal storage p = proposals[proposalCount];
        p.title = title;
        p.description = description;
        p.deadline = block.timestamp + durationInSeconds;

        emit ProposalCreated(proposalCount, title, p.deadline);
        proposalCount++;
    }

    /// @notice Cast a vote on a proposal
    function vote(uint256 proposalId, bool support) external onlyAuthorized {
        Proposal storage p = proposals[proposalId];
        require(block.timestamp <= p.deadline, "Voting closed");
        require(!p.hasVoted[msg.sender], "Already voted");

        p.hasVoted[msg.sender] = true;
        if (support) {
            p.yesVotes++;
        } else {
            p.noVotes++;
        }

        emit Voted(proposalId, msg.sender, support);
    }

    /// @notice Execute a proposal after deadline
    function executeProposal(uint256 proposalId) external onlyScrollsmith {
        Proposal storage p = proposals[proposalId];
        require(block.timestamp > p.deadline, "Voting still active");
        require(!p.executed, "Already executed");

        p.executed = true;
        bool passed = p.yesVotes > p.noVotes;

        emit ProposalExecuted(proposalId, passed);
    }

    /// @notice View proposal details
    function getProposal(uint256 proposalId) external view returns (
        string memory title,
        string memory description,
        uint256 deadline,
        uint256 yesVotes,
        uint256 noVotes,
        bool executed
    ) {
        Proposal storage p = proposals[proposalId];
        return (
            p.title,
            p.description,
            p.deadline,
            p.yesVotes,
            p.noVotes,
            p.executed
        );
    }
}
