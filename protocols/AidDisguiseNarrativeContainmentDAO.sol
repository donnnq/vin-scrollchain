// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AidDisguiseNarrativeContainmentDAO {
    address public steward;

    struct ContainmentEntry {
        string timestamp;
        string aidSource;
        string disguiseChannel;
        string influenceIntent;
        string diplomaticDisguiseSignal;
        string emotionalTag;
    }

    ContainmentEntry[] public registry;

    event AidDisguiseContained(string timestamp, string aidSource, string disguiseChannel, string influenceIntent, string diplomaticDisguiseSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containDisguise(
        string memory timestamp,
        string memory aidSource,
        string memory disguiseChannel,
        string memory influenceIntent,
        string memory diplomaticDisguiseSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ContainmentEntry(timestamp, aidSource, disguiseChannel, influenceIntent, diplomaticDisguiseSignal, emotionalTag));
        emit AidDisguiseContained(timestamp, aidSource, disguiseChannel, influenceIntent, diplomaticDisguiseSignal, emotionalTag);
    }
}
