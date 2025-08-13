// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinWorkerDAO {
    struct Proposal {
        string title;
        string description;
        uint256 voteYes;
        uint256 voteNo;
        bool executed;
        uint256 timestamp;
    }

    Proposal[] public proposals;
    mapping(address => mapping(uint => bool)) public hasVoted;

    event ProposalCreated(string title, string description);
    event Voted(address voter, uint proposalId, bool vote);
    event ProposalExecuted(uint proposalId);

    function createProposal(string memory title, string memory description) public {
        proposals.push(Proposal(title, description, 0, 0, false, block.timestamp));
        emit ProposalCreated(title, description);
    }

    function vote(uint proposalId, bool voteYes) public {
        require(!hasVoted[msg.sender][proposalId], "Already voted.");
        hasVoted[msg.sender][proposalId] = true;
        if (voteYes) {
            proposals[proposalId].voteYes++;
        } else {
            proposals[proposalId].voteNo++;
        }
        emit Voted(msg.sender, proposalId, voteYes);
    }

    function executeProposal(uint proposalId) public {
        Proposal storage p = proposals[proposalId];
        require(!p.executed, "Already executed.");
        require(p.voteYes > p.voteNo, "Proposal rejected.");
        p.executed = true;
        emit ProposalExecuted(proposalId);
    }

    function getProposal(uint index) public view returns (
        string memory, string memory, uint256, uint256, bool, uint256
    ) {
        Proposal memory p = proposals[index];
        return (p.title, p.description, p.voteYes, p.voteNo, p.executed, p.timestamp);
    }

    function totalProposals() public view returns (uint) {
        return proposals.length;
    }
}
