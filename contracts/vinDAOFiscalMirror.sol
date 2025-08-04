// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinDAOFiscalMirror {
    address public mirrorOracle;
    uint256 public proposalCount;

    enum PolicyType { TaxExemption, SubsidyAllocation, DignityAllowance }

    struct FiscalProposal {
        address proposer;
        PolicyType policy;
        string description;
        uint256 timestamp;
        bool ratified;
    }

    mapping(uint256 => FiscalProposal) public proposals;

    event ProposalSubmitted(uint256 id, address proposer, PolicyType policy, string description);
    event ProposalRatified(uint256 id, string description);

    constructor() {
        mirrorOracle = msg.sender;
    }

    function submitProposal(PolicyType policy, string memory description) external {
        proposals[proposalCount] = FiscalProposal(
            msg.sender,
            policy,
            description,
            block.timestamp,
            false
        );
        emit ProposalSubmitted(proposalCount, msg.sender, policy, description);
        proposalCount++;
    }

    function ratifyProposal(uint256 id) external {
        require(msg.sender == mirrorOracle, "Only oracle may ratify");
        require(!proposals[id].ratified, "Already ratified");
        proposals[id].ratified = true;
        emit ProposalRatified(id, proposals[id].description);
    }

    function viewProposal(uint256 id) external view returns (FiscalProposal memory) {
        return proposals[id];
    }
}
