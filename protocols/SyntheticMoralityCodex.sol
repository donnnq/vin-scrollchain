// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SyntheticMoralityCodex {
    address public steward;

    struct MoralityEntry {
        string AIModel;
        string ethicalScenario;
        string moralDirective;
        string emotionalTag;
    }

    MoralityEntry[] public codex;

    event SyntheticMoralityLogged(string AIModel, string ethicalScenario, string moralDirective, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logMorality(
        string memory AIModel,
        string memory ethicalScenario,
        string memory moralDirective,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(MoralityEntry(AIModel, ethicalScenario, moralDirective, emotionalTag));
        emit SyntheticMoralityLogged(AIModel, ethicalScenario, moralDirective, emotionalTag);
    }
}
