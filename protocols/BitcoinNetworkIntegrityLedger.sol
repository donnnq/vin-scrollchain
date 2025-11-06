// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BitcoinNetworkIntegrityLedger {
    address public steward;

    struct IntegrityEntry {
        string minerName;
        string behaviorType;
        string anomalyDetected;
        string emotionalTag;
    }

    IntegrityEntry[] public ledger;

    event MinerBehaviorTagged(string minerName, string behaviorType, string anomalyDetected, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagBehavior(
        string memory minerName,
        string memory behaviorType,
        string memory anomalyDetected,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(IntegrityEntry(minerName, behaviorType, anomalyDetected, emotionalTag));
        emit MinerBehaviorTagged(minerName, behaviorType, anomalyDetected, emotionalTag);
    }
}
