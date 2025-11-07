// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegacyOutletNarrativeContainmentProtocol {
    address public steward;

    struct ContainmentEntry {
        string outletName;
        string timestamp;
        string biasType;
        string framingTactic;
        string emotionalTag;
    }

    ContainmentEntry[] public protocol;

    event NarrativeContained(string outletName, string timestamp, string biasType, string framingTactic, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containNarrative(
        string memory outletName,
        string memory timestamp,
        string memory biasType,
        string memory framingTactic,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(ContainmentEntry(outletName, timestamp, biasType, framingTactic, emotionalTag));
        emit NarrativeContained(outletName, timestamp, biasType, framingTactic, emotionalTag);
    }
}
