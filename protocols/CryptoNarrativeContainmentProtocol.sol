// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoNarrativeContainmentProtocol {
    address public steward;

    struct Narrative {
        string theme;
        string source;
        string timestamp;
        string sentiment;
        string emotionalTag;
    }

    Narrative[] public containmentLog;

    event NarrativeContained(string theme, string source, string timestamp, string sentiment, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containNarrative(
        string memory theme,
        string memory source,
        string memory timestamp,
        string memory sentiment,
        string memory emotionalTag
    ) public onlySteward {
        containmentLog.push(Narrative(theme, source, timestamp, sentiment, emotionalTag));
        emit NarrativeContained(theme, source, timestamp, sentiment, emotionalTag);
    }
}
