// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinScrollSanctum — Master protocol for scroll governance and ritual synergy
contract vinScrollSanctum {
    struct Proposal {
        string title;
        string action;
        address proposer;
        uint256 timestamp;
        uint256 votes;
        bool executed;
    }

    Proposal[] public proposals;
    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event ProposalSubmitted(string title, address indexed proposer, string action);
    event ProposalVoted(uint256 indexed proposalId, address indexed voter);
    event SanctumDecree(uint256 indexed proposalId, string action);

    uint256 public constant VOTE_THRESHOLD = 3;

    /// @notice Submit a ritual proposal
    function submitProposal(string memory title, string memory action) external {
        proposals.push(Proposal({
            title: title,
            action: action,
            proposer: msg.sender,
            timestamp: block.timestamp,
            votes: 0,
            executed: false
        }));

        emit ProposalSubmitted(title, msg.sender, action);
    }

    /// @notice Vote on a proposal
    function voteOnProposal(uint256 proposalId) external {
        require(proposalId < proposals.length, "Invalid proposal");
        require(!hasVoted[proposalId][msg.sender], "Already voted");

        proposals[proposalId].votes++;
        hasVoted[proposalId][msg.sender] = true;

        emit ProposalVoted(proposalId, msg.sender);

        if (proposals[proposalId].votes >= VOTE_THRESHOLD && !proposals[proposalId].executed) {
            proposals[proposalId].executed = true;
            emit SanctumDecree(proposalId, proposals[proposalId].action);
        }
    }

    /// @notice View active proposals
    function getActiveProposals() external view returns (Proposal[] memory active) {
        uint256 count;
        for (uint i = 0; i < proposals.length; i++) {
            if (!proposals[i].executed) count++;
        }

        active = new Proposal[](count);
        uint256 idx;
        for (uint i = 0; i < proposals.length; i++) {
            if (!proposals[i].executed) {
                active[idx++] = proposals[i];
            }
        }
    }
}
