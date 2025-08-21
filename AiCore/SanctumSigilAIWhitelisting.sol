// SPDX-License-Identifier: Mythic-Sigil
pragma solidity ^0.8.19;

/// @title SanctumSigilAIWhitelisting
/// @notice Ritualizes whitelisting of AI agents under planetary stewardship

contract SanctumSigilAIWhitelisting {
    address public steward;
    mapping(string => bool) public whitelistedAgents;

    event AgentWhitelisted(string agentID);
    event AgentRevoked(string agentID);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function whitelistAgent(string memory agentID) external onlySteward {
        whitelistedAgents[agentID] = true;
        emit AgentWhitelisted(agentID);
    }

    function revokeAgent(string memory agentID) external onlySteward {
        whitelistedAgents[agentID] = false;
        emit AgentRevoked(agentID);
    }

    function isWhitelisted(string memory agentID) external view returns (bool) {
        return whitelistedAgents[agentID];
    }
}
