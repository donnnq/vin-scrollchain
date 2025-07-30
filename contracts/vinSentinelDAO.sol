// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinSentinelDAO {
    struct Proposal {
        uint id;
        string description;
        uint votesFor;
        uint votesAgainst;
        bool executed;
    }

    Proposal[] public proposals;
    mapping(address => uint) public dignityWeight;
    mapping(address => mapping(uint => bool)) private hasVoted;

    event ProposalCreated(uint indexed id, string description);
    event Voted(uint indexed proposalId, bool support, uint weight);
    event Executed(uint indexed proposalId);

    modifier onlyHighDignity() {
        require(dignityWeight[msg.sender] > 50, "Insufficient dignity weight");
        _;
    }

    /// @notice Assign or update a user’s dignity weight (admin-only in practice)
    function setDignityWeight(address user, uint weight) public {
        dignityWeight[user] = weight;
    }

    /// @notice High-dignity holders can create new proposals
    function createProposal(string memory description) public onlyHighDignity {
        proposals.push(Proposal({
            id: proposals.length,
            description: description,
            votesFor: 0,
            votesAgainst: 0,
            executed: false
        }));
        emit ProposalCreated(proposals.length - 1, description);
    }

    /// @notice Anyone with weight >0 can vote once per proposal
    function vote(uint proposalId, bool support) public {
        require(dignityWeight[msg.sender] > 0, "No dignity weight");
        Proposal storage prop = proposals[proposalId];
        require(!prop.executed, "Already executed");
        require(!hasVoted[msg.sender][proposalId], "Already voted");

        uint weight = dignityWeight[msg.sender];
        hasVoted[msg.sender][proposalId] = true;

        if (support) {
            prop.votesFor += weight;
        } else {
            prop.votesAgainst += weight;
        }

        emit Voted(proposalId, support, weight);
    }

    /// @notice High-dignity holders can execute approved proposals
    function executeProposal(uint proposalId) public onlyHighDignity {
        Proposal storage prop = proposals[proposalId];
        require(!prop.executed, "Already executed");
        require(prop.votesFor > prop.votesAgainst, "Not approved");

        prop.executed = true;
        emit Executed(proposalId);

        // hook for on-chain execution logic, e.g., triggering infraGenesis
    }

    /// @notice Fetch proposal details
    function getProposal(uint proposalId) public view returns (
        uint id,
        string memory description,
        uint votesFor,
        uint votesAgainst,
        bool executed
    ) {
        Proposal storage p = proposals[proposalId];
        return (p.id, p.description, p.votesFor, p.votesAgainst, p.executed);
    }
}
