// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HateSpeechKarmaTribunalDAO {
    address public steward;

    struct TribunalEntry {
        string actor;
        string corridor;
        string speechType;
        string karmaVerdict;
        string emotionalTag;
    }

    TribunalEntry[] public registry;

    event HateSpeechJudged(string actor, string corridor, string speechType, string karmaVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function judgeSpeech(
        string memory actor,
        string memory corridor,
        string memory speechType,
        string memory karmaVerdict,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TribunalEntry(actor, corridor, speechType, karmaVerdict, emotionalTag));
        emit HateSpeechJudged(actor, corridor, speechType, karmaVerdict, emotionalTag);
    }
}
