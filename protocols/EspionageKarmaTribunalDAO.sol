// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EspionageKarmaTribunalDAO {
    address public steward;

    struct TribunalEntry {
        string actor;
        string espionageCorridor;
        string karmaVerdict;
        string emotionalTag;
    }

    TribunalEntry[] public registry;

    event KarmaJudged(string actor, string espionageCorridor, string karmaVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function judgeKarma(
        string memory actor,
        string memory espionageCorridor,
        string memory karmaVerdict,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TribunalEntry(actor, espionageCorridor, karmaVerdict, emotionalTag));
        emit KarmaJudged(actor, espionageCorridor, karmaVerdict, emotionalTag);
    }
}
