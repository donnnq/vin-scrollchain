// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinPushDeliberationVault {
    struct Proposal {
        address initiator;
        address contractAddr;
        string summaryText;
        uint256 deadline;
        uint256 votesYes;
        uint256 votesNo;
        bool finalized;
    }

    mapping(uint256 => Proposal) public proposals;
    mapping(uint256 => mapping(address => bool)) public hasVoted;
    uint256 public proposalCount;

    event NewProposalGenerated(address initiator, address contractAddr, string summary);
    event Voted(address voter, uint256 proposalId, bool vote);
    event ProposalFinalized(uint256 proposalId, bool approved);

    function pushContractProposal(address _contractAddr, string calldata _summary) external {
        Proposal storage p = proposals[proposalCount];
        p.initiator = msg.sender;
        p.contractAddr = _contractAddr;
        p.summaryText = _summary;
        p.deadline = block.timestamp + 20 minutes;
        p.finalized = false;
        proposalCount++;
        emit NewProposalGenerated(msg.sender, _contractAddr, _summary);
    }

    function voteOnProposal(uint256 _id, bool voteYes) external {
        Proposal storage p = proposals[_id];
        require(block.timestamp <= p.deadline, "Voting closed");
        require(!hasVoted[_id][msg.sender], "Already voted");

        hasVoted[_id][msg.sender] = true;
        if (voteYes) {
            p.votesYes++;
        } else {
            p.votesNo++;
        }
        emit Voted(msg.sender, _id, voteYes);
    }

    function finalizeProposal(uint256 _id) external {
        Proposal storage p = proposals[_id];
        require(block.timestamp > p.deadline, "Voting still active");
        require(!p.finalized, "Already finalized");

        p.finalized = true;
        bool approved = p.votesYes > p.votesNo;
        emit ProposalFinalized(_id, approved);
        // Pwede kang maglagay dito ng auto-deployment logic kung approved
    }
}
