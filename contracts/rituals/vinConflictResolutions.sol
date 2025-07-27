// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @title vinConflictResolution
/// @notice Decentralized arbitration and mediation ritual.
contract vinConflictResolution is Ownable {
    struct Dispute {
        uint256 scrollId;
        string  description;
        uint256 votesFor;
        uint256 votesAgainst;
        bool    executed;
        mapping(address => bool) hasVoted;
    }

    uint256 public nextDisputeId;
    mapping(uint256 => Dispute) public disputes;

    event DisputeFiled(uint256 indexed disputeId, address indexed filer);
    event ResolutionVoted(uint256 indexed disputeId, address indexed voter, bool inFavor);
    event ResolutionExecuted(uint256 indexed disputeId, bool outcome);

    /// @notice File a new dispute over a scroll/action.
    function submitDispute(uint256 scrollId, string calldata description) external {
        uint256 id = nextDisputeId++;
        Dispute storage d = disputes[id];
        d.scrollId = scrollId;
        d.description = description;
        emit DisputeFiled(id, msg.sender);
    }

    /// @notice Vote on a dispute; weight could be tied to trustRate off-chain.
    function voteResolution(uint256 disputeId, bool inFavor) external {
        Dispute storage d = disputes[disputeId];
        require(!d.hasVoted[msg.sender], "Already voted");
        require(!d.executed, "Already executed");
        d.hasVoted[msg.sender] = true;
        if (inFavor) d.votesFor++;
        else         d.votesAgainst++;
        emit ResolutionVoted(disputeId, msg.sender, inFavor);
    }

    /// @notice Execute the dispute outcome once voting is done.
    function executeResolution(uint256 disputeId) external onlyOwner {
        Dispute storage d = disputes[disputeId];
        require(!d.executed, "Already done");
        bool outcome = d.votesFor >= d.votesAgainst;
        d.executed = true;
        emit ResolutionExecuted(disputeId, outcome);
    }
}
