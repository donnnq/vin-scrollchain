// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelectiveJusticeContainmentProtocol {
    address public steward;

    struct ContainmentEntry {
        string timestamp;
        string legalActionType;
        string politicizationMethod;
        string ruleOfLawBreachSignal;
        string institutionalDistortionTag;
    }

    ContainmentEntry[] public protocol;

    event SelectiveJusticeContained(string timestamp, string legalActionType, string politicizationMethod, string ruleOfLawBreachSignal, string institutionalDistortionTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containSelectiveJustice(
        string memory timestamp,
        string memory legalActionType,
        string memory politicizationMethod,
        string memory ruleOfLawBreachSignal,
        string memory institutionalDistortionTag
    ) public onlySteward {
        protocol.push(ContainmentEntry(timestamp, legalActionType, politicizationMethod, ruleOfLawBreachSignal, institutionalDistortionTag));
        emit SelectiveJusticeContained(timestamp, legalActionType, politicizationMethod, ruleOfLawBreachSignal, institutionalDistortionTag);
    }
}
