// SPDX-License-Identifier: Shelter-DAO-Scroll
pragma solidity ^0.8.19;

contract vinCommunityShelterDAO {
    address public founder;
    uint256 public proposalCount;

    struct Proposal {
        string title;
        string description;
        uint256 voteYes;
        uint256 voteNo;
        bool executed;
        mapping(address => bool) voters;
    }

    mapping(uint256 => Proposal) public proposals;
    mapping(address => uint256) public equityTokens;

    event ProposalCreated(uint256 id, string title);
    event Voted(address indexed voter, uint256 proposalId, bool support);
    event ProposalExecuted(uint256 id, string result);

    modifier onlyFounder() {
        require(msg.sender == founder, "Only founder may invoke");
        _;
    }

    constructor() {
        founder = msg.sender;
    }

    function allocateTokens(address member, uint256 amount) external onlyFounder {
        equityTokens[member] += amount;
    }

    function createProposal(string calldata title, string calldata description) external {
        require(equityTokens[msg.sender] > 0, "Must hold shelter equity");
        Proposal storage p = proposals[proposalCount++];
        p.title = title;
        p.description = description;
        emit ProposalCreated(proposalCount - 1, title);
    }

    function vote(uint256 proposalId, bool support) external {
        Proposal storage p = proposals[proposalId];
        require(equityTokens[msg.sender] > 0, "No voting rights");
        require(!p.voters[msg.sender], "Already voted");
        p.voters[msg.sender] = true;

        if (support) {
            p.voteYes += equityTokens[msg.sender];
        } else {
            p.voteNo += equityTokens[msg.sender];
        }

        emit Voted(msg.sender, proposalId, support);
    }

    function executeProposal(uint256 proposalId) external onlyFounder {
        Proposal storage p = proposals[proposalId];
        require(!p.executed, "Already executed");
        p.executed = true;

        string memory result = p.voteYes > p.voteNo ? "Approved" : "Rejected";
        emit ProposalExecuted(proposalId, result);
    }
}
