// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenatorImmunityContainmentProtocol {
    address public steward;

    struct ContainmentEntry {
        string timestamp;
        string senatorName;
        string legalActionType;
        string immunityStatus;
        string ruleOfLawTensionSignal;
        string institutionalConsequenceTag;
    }

    ContainmentEntry[] public protocol;

    event SenatorImmunityContained(string timestamp, string senatorName, string legalActionType, string immunityStatus, string ruleOfLawTensionSignal, string institutionalConsequenceTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containImmunity(
        string memory timestamp,
        string memory senatorName,
        string memory legalActionType,
        string memory immunityStatus,
        string memory ruleOfLawTensionSignal,
        string memory institutionalConsequenceTag
    ) public onlySteward {
        protocol.push(ContainmentEntry(timestamp, senatorName, legalActionType, immunityStatus, ruleOfLawTensionSignal, institutionalConsequenceTag));
        emit SenatorImmunityContained(timestamp, senatorName, legalActionType, immunityStatus, ruleOfLawTensionSignal, institutionalConsequenceTag);
    }
}
