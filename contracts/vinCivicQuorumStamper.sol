// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinCivicQuorumStamper {
    uint public quorumThreshold = 3;
    mapping(uint => string[]) public approvals;
    event QuorumReached(uint proposalId, string[] approvers);

    function approve(uint proposalId, string memory approver) public {
        approvals[proposalId].push(approver);
        if (approvals[proposalId].length >= quorumThreshold) {
            emit QuorumReached(proposalId, approvals[proposalId]);
        }
    }

    function getApprovers(uint proposalId) public view returns (string[] memory) {
        return approvals[proposalId];
    }
}
