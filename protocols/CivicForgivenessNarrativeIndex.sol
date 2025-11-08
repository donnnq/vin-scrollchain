// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicForgivenessNarrativeIndex {
    address public steward;

    struct ForgivenessEntry {
        string timestamp;
        string traumaType;
        string forgivenessChannel;
        string reconciliationOutcome;
        string emotionalTag;
    }

    ForgivenessEntry[] public index;

    event ForgivenessNarrativeIndexed(string timestamp, string traumaType, string forgivenessChannel, string reconciliationOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexForgiveness(
        string memory timestamp,
        string memory traumaType,
        string memory forgivenessChannel,
        string memory reconciliationOutcome,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ForgivenessEntry(timestamp, traumaType, forgivenessChannel, reconciliationOutcome, emotionalTag));
        emit ForgivenessNarrativeIndexed(timestamp, traumaType, forgivenessChannel, reconciliationOutcome, emotionalTag);
    }
}
