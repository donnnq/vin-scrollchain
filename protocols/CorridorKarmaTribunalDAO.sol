// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CorridorKarmaTribunalDAO {
    address public steward;

    struct TribunalEntry {
        string corridor;
        string karmaVerdict;
        string freightActor;
        string emotionalTag;
    }

    TribunalEntry[] public registry;

    event KarmaJudged(string corridor, string karmaVerdict, string freightActor, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function judgeKarma(
        string memory corridor,
        string memory karmaVerdict,
        string memory freightActor,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TribunalEntry(corridor, karmaVerdict, freightActor, emotionalTag));
        emit KarmaJudged(corridor, karmaVerdict, freightActor, emotionalTag);
    }
}
