// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title TradeDAO - Scrollchain DAO for moderating NTB entries using strike-based governance
/// @author VINVIN
/// @notice DAO system to govern cross-border product entries and enforce 3-strike protocols

contract TradeDAO {
    address public daoFounder;
    uint256 public proposalWindow = 48 hours;
    uint256 public memberCount;

    struct Member {
        address memberAddress;
        bool isActive;
    }

    struct Proposal {
        string description;
        address applicant;
        uint256 timestamp;
        bool resolved;
        uint8 yesVotes;
        uint8 noVotes;
    }

    struct EntryStatus {
        bool isAllowed;
        uint8 strikeLevel;
        bool isBanned;
    }

    mapping(address => Member) public members;
    mapping(address => EntryStatus) public traderStatus;
    mapping(uint256 => Proposal) public proposals;

    uint256 public proposalCounter;

    event MemberJoined(address indexed member);
    event EntryStrike(address indexed trader, uint8 strikeLevel);
    event EntryBan(address indexed trader);
    event ProposalCreated(uint256 indexed id, string description);
    event ProposalResolved(uint256 indexed id, bool approved);

    modifier onlyFounder() {
        require(msg.sender == daoFounder, "Not founder");
        _;
    }

    modifier onlyMember() {
        require(members[msg.sender].isActive, "Not DAO member");
        _;
    }

    constructor() {
        daoFounder = msg.sender;
        members[msg.sender] = Member(msg.sender, true);
        memberCount += 1;
    }

    function joinDAO() external {
        require(!members[msg.sender].isActive, "Already member");
        members[msg.sender] = Member(msg.sender, true);
        memberCount += 1;
        emit MemberJoined(msg.sender);
    }

    function createProposal(string memory _desc, address _applicant) external onlyMember {
        proposals[proposalCounter] = Proposal(_desc, _applicant, block.timestamp, false, 0, 0);
        emit ProposalCreated(proposalCounter, _desc);
        proposalCounter += 1;
    }

    function voteProposal(uint256 _id, bool _approve) external onlyMember {
        Proposal storage prop = proposals[_id];
        require(!prop.resolved, "Already resolved");
        require(block.timestamp <= prop.timestamp + proposalWindow, "Voting closed");

        if (_approve) {
            prop.yesVotes += 1;
        } else {
            prop.noVotes += 1;
        }

        if (prop.yesVotes + prop.noVotes >= memberCount) {
            prop.resolved = true;
            bool approved = prop.yesVotes > prop.noVotes;
            traderStatus[prop.applicant].isAllowed = approved;
            emit ProposalResolved(_id, approved);
        }
    }

    function issueStrike(address _trader) external onlyMember {
        EntryStatus storage entry = traderStatus[_trader];
        require(!entry.isBanned, "Already banned");

        entry.strikeLevel += 1;
        emit EntryStrike(_trader, entry.strikeLevel);

        if (entry.strikeLevel >= 3) {
            entry.isBanned = true;
            entry.isAllowed = false;
            emit EntryBan(_trader);
        }
    }

    function resetStrike(address _trader) external onlyFounder {
        traderStatus[_trader].strikeLevel = 0;
        traderStatus[_trader].isBanned = false;
        traderStatus[_trader].isAllowed = true;
    }

    function updateProposalWindow(uint256 _newWindow) external onlyFounder {
        proposalWindow = _newWindow;
    }
}
