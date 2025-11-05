// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HumanSovereigntySignalIndex {
    address public steward;

    struct SignalEntry {
        string barangay;
        string workerName;
        string sovereigntySignal;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event HumanSovereigntyTagged(string barangay, string workerName, string sovereigntySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSovereignty(
        string memory barangay,
        string memory workerName,
        string memory sovereigntySignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(barangay, workerName, sovereigntySignal, emotionalTag));
        emit HumanSovereigntyTagged(barangay, workerName, sovereigntySignal, emotionalTag);
    }
}
