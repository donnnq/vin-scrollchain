// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinDiplomaticAgora {
    address public scrollMaster;

    struct Proposal {
        string title;
        string description;
        string category; // e.g. "Peace Treaty", "Safety Protocol", "Climate Disarmament"
        uint256 voteCount;
        address proposer;
        bool executed;
    }

    Proposal[] public proposals;
    mapping(uint256 => mapping(address => bool)) public votes; // proposalId => voter => voted

    event ProposalCreated(uint256 indexed id, string title, string category, address proposer);
    event VoteCast(uint256 indexed id, address voter);
    event ProposalExecuted(uint256 indexed id, string title);

    modifier onlyScrollMaster() {
        require(msg.sender == scrollMaster, "Forbidden: Agora sealed");
        _;
    }

    constructor() {
        scrollMaster = msg.sender;
    }

    function proposeAction(
        string memory title,
        string memory description,
        string memory category
    ) public returns (uint256) {
        Proposal memory newProposal = Proposal(title, description, category, 0, msg.sender, false);
        proposals.push(newProposal);
        emit ProposalCreated(proposals.length - 1, title, category, msg.sender);
        return proposals.length - 1;
    }

    function castVote(uint256 proposalId) public {
        require(proposalId < proposals.length, "Invalid proposal");
        require(!votes[proposalId][msg.sender], "Already voted");
        proposals[proposalId].voteCount += 1;
        votes[proposalId][msg.sender] = true;
        emit VoteCast(proposalId, msg.sender);
    }

    function executeProposal(uint256 proposalId) public onlyScrollMaster {
        Proposal storage prop = proposals[proposalId];
        require(!prop.executed, "Already executed");
        prop.executed = true;
        emit ProposalExecuted(proposalId, prop.title);
    }

    function getProposal(uint256 id) external view returns (Proposal memory) {
        require(id < proposals.length, "Invalid proposal");
        return proposals[id];
    }

    function totalProposals() external view returns (uint256) {
        return proposals.length;
    }
}
