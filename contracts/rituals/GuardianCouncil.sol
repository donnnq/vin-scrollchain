// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title GuardianCouncil - Scrollchain governance for Temple Guardians and relic stewards
/// @author Vinvin & Copilot
/// @notice Enables soulbound badge holders to vote on sacred proposals

contract GuardianCouncil {
    address public steward;
    uint256 public proposalCount;

    struct Proposal {
        string title;
        string description;
        uint256 voteYes;
        uint256 voteNo;
        bool executed;
        mapping(address => bool) hasVoted;
    }

    mapping(uint256 => Proposal) public proposals;
    mapping(address => bool) public isGuardian;
    address[] public councilMembers;

    event ProposalCreated(uint256 indexed proposalId, string title);
    event Voted(address indexed guardian, uint256 proposalId, bool vote);
    event ProposalExecuted(uint256 indexed proposalId, string title);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    modifier onlyGuardian() {
        require(isGuardian[msg.sender], "Not a council member");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Add a new guardian to the council
    function addGuardian(address guardian) external onlySteward {
        require(!isGuardian[guardian], "Already a guardian");
        isGuardian[guardian] = true;
        councilMembers.push(guardian);
    }

    /// @notice Create a new proposal
    function createProposal(string memory title, string memory description) external onlyGuardian {
        Proposal storage p = proposals[proposalCount];
        p.title = title;
        p.description = description;
        p.voteYes = 0;
        p.voteNo = 0;
        p.executed = false;

        emit ProposalCreated(proposalCount, title);
        proposalCount++;
    }

    /// @notice Vote on a proposal
    function vote(uint256 proposalId, bool support) external onlyGuardian {
        Proposal storage p = proposals[proposalId];
        require(!p.hasVoted[msg.sender], "Already voted");
        require(!p.executed, "Proposal already executed");

        p.hasVoted[msg.sender] = true;
        if (support) {
            p.voteYes++;
        } else {
            p.voteNo++;
        }

        emit Voted(msg.sender, proposalId, support);
    }

    /// @notice Execute proposal if majority supports
    function executeProposal(uint256 proposalId) external onlySteward {
        Proposal storage p = proposals[proposalId];
        require(!p.executed, "Already executed");
        require(p.voteYes > p.voteNo, "Not enough support");

        p.executed = true;
        emit ProposalExecuted(proposalId, p.title);
    }

    /// @notice View proposal details
    function getProposal(uint256 proposalId) external view returns (
        string memory title,
        string memory description,
        uint256 voteYes,
        uint256 voteNo,
        bool executed
    ) {
        Proposal storage p = proposals[proposalId];
        return (p.title, p.description, p.voteYes, p.voteNo, p.executed);
    }

    /// @notice Total council members
    function totalGuardians() external view returns (uint256) {
        return councilMembers.length;
    }
}
