// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicApologyContainmentProtocol {
    address public steward;

    struct ContainmentEntry {
        string timestamp;
        string apologyIssuer;
        string apologyType;
        string sinceritySignal;
        string civicImpactTag;
        string emotionalTag;
    }

    ContainmentEntry[] public protocol;

    event PublicApologyContained(string timestamp, string apologyIssuer, string apologyType, string sinceritySignal, string civicImpactTag, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containApology(
        string memory timestamp,
        string memory apologyIssuer,
        string memory apologyType,
        string memory sinceritySignal,
        string memory civicImpactTag,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(ContainmentEntry(timestamp, apologyIssuer, apologyType, sinceritySignal, civicImpactTag, emotionalTag));
        emit PublicApologyContained(timestamp, apologyIssuer, apologyType, sinceritySignal, civicImpactTag, emotionalTag);
    }
}
