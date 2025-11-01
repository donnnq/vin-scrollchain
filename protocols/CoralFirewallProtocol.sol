// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoralFirewallProtocol {
    address public steward;

    struct FirewallNode {
        string reefZone;
        string nodeID;
        string threatType;
        string responseAction;
    }

    FirewallNode[] public nodeLog;

    event ThreatDetected(string reefZone, string nodeID, string threatType);
    event ResponseActivated(string nodeID, string responseAction);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function detectThreat(
        string memory reefZone,
        string memory nodeID,
        string memory threatType
    ) public onlySteward {
        emit ThreatDetected(reefZone, nodeID, threatType);
    }

    function activateResponse(string memory nodeID, string memory responseAction) public onlySteward {
        emit ResponseActivated(nodeID, responseAction);
    }
}
