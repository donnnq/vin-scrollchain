// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICCArrestWarrantSignalAmplifier {
    address public steward;

    struct SignalEntry {
        string timestamp;
        string subjectName;
        string allegedCrime;
        string jurisdictionScope;
        string transnationalConsequenceSignal;
        string humanDignityTag;
    }

    SignalEntry[] public index;

    event ICCWarrantSignalAmplified(string timestamp, string subjectName, string allegedCrime, string jurisdictionScope, string transnationalConsequenceSignal, string humanDignityTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function amplifySignal(
        string memory timestamp,
        string memory subjectName,
        string memory allegedCrime,
        string memory jurisdictionScope,
        string memory transnationalConsequenceSignal,
        string memory humanDignityTag
    ) public onlySteward {
        index.push(SignalEntry(timestamp, subjectName, allegedCrime, jurisdictionScope, transnationalConsequenceSignal, humanDignityTag));
        emit ICCWarrantSignalAmplified(timestamp, subjectName, allegedCrime, jurisdictionScope, transnationalConsequenceSignal, humanDignityTag);
    }
}
