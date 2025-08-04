// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinBarangaySignalDAO {
    address public scrollAdmin;
    uint256 public proposalCount;
    uint256 public signalCount;

    struct Proposal {
        uint256 id;
        string barangay;
        string infoSubject;
        string actionRequested;
        uint256 upvotes;
        uint256 downvotes;
        bool resolved;
    }

    struct Signal {
        string message;
        uint256 timestamp;
        address sender;
    }

    mapping(uint256 => Proposal) public proposals;
    Signal[] public signalBoard;

    event ProposalSubmitted(uint256 indexed id, string barangay, string subject);
    event Voted(uint256 indexed id, address voter, bool support);
    event SignalEmitted(string message, address sender);

    constructor() {
        scrollAdmin = msg.sender;
    }

    function submitProposal(string memory barangay, string memory infoSubject, string memory actionRequested) external {
        proposalCount++;
        proposals[proposalCount] = Proposal(proposalCount, barangay, infoSubject, actionRequested, 0, 0, false);
        emit ProposalSubmitted(proposalCount, barangay, infoSubject);
    }

    function voteProposal(uint256 id, bool support) external {
        Proposal storage p = proposals[id];
        require(!p.resolved, "Proposal already resolved");
        support ? p.upvotes++ : p.downvotes++;
        emit Voted(id, msg.sender, support);
    }

    function resolveProposal(uint256 id) external {
        require(msg.sender == scrollAdmin, "Only admin can resolve");
        proposals[id].resolved = true;
    }

    function emitSignal(string memory message) external {
        signalBoard.push(Signal(message, block.timestamp, msg.sender));
        emit SignalEmitted(message, msg.sender);
    }

    function getSignal(uint256 index) external view returns (Signal memory) {
        return signalBoard[index];
    }

    function signalLogLength() external view returns (uint256) {
        return signalBoard.length;
    }
}
