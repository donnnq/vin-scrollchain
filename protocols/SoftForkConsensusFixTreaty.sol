// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SoftForkConsensusFixTreaty {
    address public steward;

    struct ForkProposal {
        string proposalName;
        string fixType;
        string consensusImpact;
        string emotionalTag;
    }

    ForkProposal[] public treaty;

    event SoftForkProposalTagged(string proposalName, string fixType, string consensusImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagProposal(
        string memory proposalName,
        string memory fixType,
        string memory consensusImpact,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(ForkProposal(proposalName, fixType, consensusImpact, emotionalTag));
        emit SoftForkProposalTagged(proposalName, fixType, consensusImpact, emotionalTag);
    }
}
