// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReconciliationSignalAmplifier {
    address public steward;

    struct SignalEntry {
        string timestamp;
        string initiativeName;
        string reconciliationMethod;
        string communityImpact;
        string healingSignal;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event ReconciliationSignalAmplified(string timestamp, string initiativeName, string reconciliationMethod, string communityImpact, string healingSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function amplifySignal(
        string memory timestamp,
        string memory initiativeName,
        string memory reconciliationMethod,
        string memory communityImpact,
        string memory healingSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(timestamp, initiativeName, reconciliationMethod, communityImpact, healingSignal, emotionalTag));
        emit ReconciliationSignalAmplified(timestamp, initiativeName, reconciliationMethod, communityImpact, healingSignal, emotionalTag);
    }
}
