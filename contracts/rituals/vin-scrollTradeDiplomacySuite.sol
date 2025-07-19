// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title TradeDiplomacySuite - VINVIN’s complete NTB governance framework
/// @author VINVIN
/// @notice Combines NTB filtering + DAO moderation + strike logic into one mythstream protocol

contract TradeDiplomacySuite {
    address public admin;
    uint256 public strikeLimit = 3;
    uint256 public resolutionWindow = 72 hours;
    uint256 public proposalWindow = 48 hours;

    struct Trader {
        string productName;
        uint8 strikes;
        bool banned;
        uint256 lastViolation;
    }

    struct Proposal {
        address applicant;
        string description;
        uint256 timestamp;
        uint8 yes;
        uint8 no;
        bool resolved;
    }

    mapping(address => Trader) public traders;
    mapping(uint256 => Proposal) public proposals;
    mapping(address => bool) public daoMembers;

    uint256 public proposalCount;

    event TraderApproved(address indexed trader, string productName);
    event StrikeIssued(address indexed trader, uint8 strikes);
    event TraderBanned(address indexed trader);
    event ProposalCreated(uint256 indexed id);
    event ProposalResolved(uint256 indexed id, bool passed);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    modifier onlyDAO() {
        require(daoMembers[msg.sender], "Not DAO member");
        _;
    }

    constructor() {
        admin = msg.sender;
        daoMembers[msg.sender] = true;
    }

    function joinDAO() external {
        daoMembers[msg.sender] = true;
    }

    function submitTrader(string memory name) external {
        require(!traders[msg.sender].banned, "Banned trader");
        traders[msg.sender] = Trader(name, 0, false, 0);
        emit TraderApproved(msg.sender, name);
    }

    function issueStrike(address traderAddr) external onlyDAO {
        Trader storage t = traders[traderAddr];
        require(!t.banned, "Already banned");
        t.strikes += 1;
        t.lastViolation = block.timestamp;
        emit StrikeIssued(traderAddr, t.strikes);
        if (t.strikes >= strikeLimit) {
            t.banned = true;
            emit TraderBanned(traderAddr);
        }
    }

    function resolveStrike(address traderAddr) external onlyAdmin {
        Trader storage t = traders[traderAddr];
        require(t.strikes > 0, "No strike");
        require(block.timestamp <= t.lastViolation + resolutionWindow, "Too late");
        t.strikes -= 1;
    }

    function proposeApproval(string memory desc, address applicant) external onlyDAO {
        proposals[proposalCount] = Proposal(applicant, desc, block.timestamp, 0, 0, false);
        emit ProposalCreated(proposalCount);
        proposalCount++;
    }

    function voteProposal(uint256 id, bool approve) external onlyDAO {
        Proposal storage p = proposals[id];
        require(!p.resolved, "Resolved");
        require(block.timestamp <= p.timestamp + proposalWindow, "Voting ended");

        if (approve) p.yes += 1;
        else p.no += 1;

        if (p.yes + p.no >= 3) {
            p.resolved = true;
            bool result = p.yes > p.no;
            emit ProposalResolved(id, result);
        }
    }

    function updateLimits(uint256 newLimit, uint256 newWindow, uint256 newProposalWindow) external onlyAdmin {
        strikeLimit = newLimit;
        resolutionWindow = newWindow;
        proposalWindow = newProposalWindow;
    }
}
