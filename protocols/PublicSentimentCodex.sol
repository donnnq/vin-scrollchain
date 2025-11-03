// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicSentimentCodex {
    address public steward;

    struct SentimentEntry {
        string commentTheme;
        string civicConcern;
        string reformSignal;
        string emotionalTag;
    }

    SentimentEntry[] public codex;

    event PublicSentimentLogged(string commentTheme, string civicConcern, string reformSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logSentiment(
        string memory commentTheme,
        string memory civicConcern,
        string memory reformSignal,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SentimentEntry(commentTheme, civicConcern, reformSignal, emotionalTag));
        emit PublicSentimentLogged(commentTheme, civicConcern, reformSignal, emotionalTag);
    }
}
