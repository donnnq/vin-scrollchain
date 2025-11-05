// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract QuantumDeterrenceSignalIndex {
    address public steward;

    struct SignalEntry {
        string deterrenceSystem;
        string quantumSignal;
        string classification;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event QuantumDeterrenceSignalTagged(string deterrenceSystem, string quantumSignal, string classification, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSignal(
        string memory deterrenceSystem,
        string memory quantumSignal,
        string memory classification,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(deterrenceSystem, quantumSignal, classification, emotionalTag));
        emit QuantumDeterrenceSignalTagged(deterrenceSystem, quantumSignal, classification, emotionalTag);
    }
}
