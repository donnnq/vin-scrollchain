// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicBroadcastBiasAuditDAO {
    address public steward;

    struct BiasEntry {
        string channelName;
        string timestamp;
        string biasType;
        string manipulationTactic;
        string emotionalTag;
    }

    BiasEntry[] public registry;

    event BroadcastBiasFlagged(string channelName, string timestamp, string biasType, string manipulationTactic, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function flagBias(
        string memory channelName,
        string memory timestamp,
        string memory biasType,
        string memory manipulationTactic,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BiasEntry(channelName, timestamp, biasType, manipulationTactic, emotionalTag));
        emit BroadcastBiasFlagged(channelName, timestamp, biasType, manipulationTactic, emotionalTag);
    }
}
