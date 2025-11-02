// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TraumaFreeTrainingCodex {
    address public steward;

    struct TrainingEntry {
        string trainingPhase;
        string safetyProtocol;
        string dignityLevel;
        string emotionalTag;
    }

    TrainingEntry[] public codex;

    event TraumaFreeTrainingLogged(string trainingPhase, string safetyProtocol, string dignityLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logTraining(
        string memory trainingPhase,
        string memory safetyProtocol,
        string memory dignityLevel,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(TrainingEntry(trainingPhase, safetyProtocol, dignityLevel, emotionalTag));
        emit TraumaFreeTrainingLogged(trainingPhase, safetyProtocol, dignityLevel, emotionalTag);
    }
}
