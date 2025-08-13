// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinLegacyFleetDAO {
    struct Proposal {
        string fleetName;
        string mission;
        uint256 voteYes;
        uint256 voteNo;
        uint256 timestamp;
        bool executed;
    }

    Proposal[] public proposals;
    mapping(address => mapping(uint => bool)) public hasVoted;

    event ProposalCreated(string fleetName, string mission);
    event Voted(address voter, uint proposalId, bool vote);
    event ProposalExecuted(uint proposalId);

    function createProposal(string memory fleetName, string memory mission) public {
        proposals.push(Proposal(fleetName, mission, 0, 0, block.timestamp, false));
        emit ProposalCreated(fleetName, mission);
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
        string memory, string memory, uint256, uint256, bool
    ) {
        Proposal memory p = proposals[index];
        return (p.fleetName, p.mission, p.voteYes, p.voteNo, p.executed);
    }
}
