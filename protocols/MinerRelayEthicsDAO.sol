// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MinerRelayEthicsDAO {
    address public steward;

    struct RelayEntry {
        string minerName;
        string relayDecision;
        string ethicalAssessment;
        string emotionalTag;
    }

    RelayEntry[] public registry;

    event MinerRelayTagged(string minerName, string relayDecision, string ethicalAssessment, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRelay(
        string memory minerName,
        string memory relayDecision,
        string memory ethicalAssessment,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(RelayEntry(minerName, relayDecision, ethicalAssessment, emotionalTag));
        emit MinerRelayTagged(minerName, relayDecision, ethicalAssessment, emotionalTag);
    }
}
