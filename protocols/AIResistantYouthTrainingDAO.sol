// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIResistantYouthTrainingDAO {
    address public steward;

    struct TrainingEntry {
        string barangay;
        string resistanceSkill;
        string trainingMechanism;
        string emotionalTag;
    }

    TrainingEntry[] public registry;

    event YouthTrainingTagged(string barangay, string resistanceSkill, string trainingMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTraining(
        string memory barangay,
        string memory resistanceSkill,
        string memory trainingMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TrainingEntry(barangay, resistanceSkill, trainingMechanism, emotionalTag));
        emit YouthTrainingTagged(barangay, resistanceSkill, trainingMechanism, emotionalTag);
    }
}
