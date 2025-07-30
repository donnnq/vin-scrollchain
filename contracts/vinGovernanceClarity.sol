// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinGovernanceClarity.sol — Strengthens internal government decisions with transparency and resonance

contract vinGovernanceClarity {
    address public chairperson;
    uint public proposalCount;
    uint public decisionCooldown = 12 hours;

    struct Proposal {
        string title;
        string description;
        uint votesFor;
        uint votesAgainst;
        bool isResolved;
        uint createdAt;
    }

    Proposal[] public proposals;
    mapping(address => bool) public registeredVoters;
    mapping(address => uint) public reputationScore;
    mapping(uint => mapping(address => bool)) public hasVoted;

    event ProposalCreated(uint indexed proposalId, string title);
    event VoteCast(address indexed voter, uint indexed proposalId, bool support);
    event ProposalResolved(uint indexed proposalId, bool passed);
    event ReputationUpdated(address indexed voter, uint score);

    modifier onlyChairperson() {
        require(msg.sender == chairperson, "Only chairperson can initiate governance rites");
        _;
    }

    modifier onlyRegistered() {
        require(registeredVoters[msg.sender], "Unrecognized civic soul");
        _;
    }

    constructor() {
        chairperson = msg.sender;
    }

    /// @notice Add a voter with governance rights
    function registerVoter(address voter) public onlyChairperson {
        registeredVoters[voter] = true;
        reputationScore[voter] = 100;
    }

    /// @notice Propose a new decision ritual
    function createProposal(string memory title, string memory description) public onlyChairperson {
        proposals.push(Proposal({
            title: title,
            description: description,
            votesFor: 0,
            votesAgainst: 0,
            isResolved: false,
            createdAt: block.timestamp
        }));
        emit ProposalCreated(proposalCount++, title);
    }

    /// @notice Cast a vote
    function voteOnProposal(uint proposalId, bool support) public onlyRegistered {
        Proposal storage p = proposals[proposalId];
        require(!p.isResolved, "Resolution complete");
        require(!hasVoted[proposalId][msg.sender], "Already voted");

        hasVoted[proposalId][msg.sender] = true;

        if (support) {
            p.votesFor++;
            reputationScore[msg.sender] += 1;
        } else {
            p.votesAgainst++;
            reputationScore[msg.sender] -= 1;
        }

        emit VoteCast(msg.sender, proposalId, support);
        emit ReputationUpdated(msg.sender, reputationScore[msg.sender]);
    }

    /// @notice Finalize proposal based on votes
    function resolveProposal(uint proposalId) public onlyChairperson {
        Proposal storage p = proposals[proposalId];
        require(!p.isResolved, "Already resolved");
        require(block.timestamp >= p.createdAt + decisionCooldown, "Cooldown not met");

        p.isResolved = true;
        bool passed = p.votesFor > p.votesAgainst;
        emit ProposalResolved(proposalId, passed);
    }
}
