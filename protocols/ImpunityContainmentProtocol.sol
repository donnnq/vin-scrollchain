// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImpunityContainmentProtocol {
    address public steward;

    struct ContainmentEntry {
        string timestamp;
        string institution;
        string impunityType;
        string exposureMethod;
        string dismantlingStrategy;
        string publicReckoningSignal;
        string planetaryJusticeTag;
    }

    ContainmentEntry[] public protocol;

    event ImpunityContained(string timestamp, string institution, string impunityType, string exposureMethod, string dismantlingStrategy, string publicReckoningSignal, string planetaryJusticeTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containImpunity(
        string memory timestamp,
        string memory institution,
        string memory impunityType,
        string memory exposureMethod,
        string memory dismantlingStrategy,
        string memory publicReckoningSignal,
        string memory planetaryJusticeTag
    ) public onlySteward {
        protocol.push(ContainmentEntry(timestamp, institution, impunityType, exposureMethod, dismantlingStrategy, publicReckoningSignal, planetaryJusticeTag));
        emit ImpunityContained(timestamp, institution, impunityType, exposureMethod, dismantlingStrategy, publicReckoningSignal, planetaryJusticeTag);
    }
}
