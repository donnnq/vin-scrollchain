// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @title vinCommunityCouncil
/// @notice On-chain council of top-rated profiles for governance.
contract vinCommunityCouncil is Ownable {
    mapping(address => bool) public nominated;
    mapping(address => uint256) public candidateVotes;

    struct Proposal {
        string uri;
        uint256 forVotes;
        uint256 againstVotes;
        bool    executed;
        mapping(address => bool) hasVoted;
    }

    uint256 public nextProposalId;
    mapping(uint256 => Proposal) public proposals;

    event CandidateNominated(address indexed nominee);
    event CandidateVoted(address indexed nominee, address indexed voter, uint256 weight);
    event ProposalCreated(uint256 indexed id, string uri);
    event ProposalVoted(uint256 indexed id, address indexed voter, bool support);
    event ProposalExecuted(uint256 indexed id);

    /// @notice Nominate a candidate from top-rated profiles.
    function nominateCandidate(address nominee) external onlyOwner {
        nominated[nominee] = true;
        emit CandidateNominated(nominee);
    }

    /// @notice Vote for a nominated candidate.
    function voteCandidate(address nominee, uint256 weight) external {
        require(nominated[nominee], "Not nominated");
        candidateVotes[nominee] += weight;
        emit CandidateVoted(nominee, msg.sender, weight);
    }

    /// @notice Propose a system change or new parameter.
    function proposeChange(string calldata proposalURI) external {
        uint256 id = nextProposalId++;
        Proposal storage p = proposals[id];
        p.uri = proposalURI;
        emit ProposalCreated(id, proposalURI);
    }

    /// @notice Vote on a proposal.
    function voteProposal(uint256 proposalId, bool support) external {
        Proposal storage p = proposals[proposalId];
        require(!p.hasVoted[msg.sender], "Already voted");
        p.hasVoted[msg.sender] = true;
        if (support) p.forVotes++;
        else         p.againstVotes++;
        emit ProposalVoted(proposalId, msg.sender, support);
    }

    /// @notice Execute a passed proposal.
    function executeProposal(uint256 proposalId) external onlyOwner {
        Proposal storage p = proposals[proposalId];
        require(!p.executed, "Already executed");
        require(p.forVotes >= p.againstVotes, "Rejected");
        p.executed = true;
        emit ProposalExecuted(proposalId);
    }
}
