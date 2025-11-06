// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NodeRelayEthicsIndex {
    address public steward;

    struct EthicsEntry {
        string nodeOperator;
        string relayBehavior;
        string ethicalScore;
        string emotionalTag;
    }

    EthicsEntry[] public index;

    event NodeRelayTagged(string nodeOperator, string relayBehavior, string ethicalScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRelay(
        string memory nodeOperator,
        string memory relayBehavior,
        string memory ethicalScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(EthicsEntry(nodeOperator, relayBehavior, ethicalScore, emotionalTag));
        emit NodeRelayTagged(nodeOperator, relayBehavior, ethicalScore, emotionalTag);
    }
}
