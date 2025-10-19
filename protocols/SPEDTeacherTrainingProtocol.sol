// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SPEDTeacherTrainingProtocol {
    address public admin;

    struct TrainingEntry {
        string teacherName;
        string trainingModule;
        string region;
        string emotionalTag;
        bool summoned;
        bool completed;
        bool sealed;
    }

    TrainingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTraining(string memory teacherName, string memory trainingModule, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(TrainingEntry(teacherName, trainingModule, region, emotionalTag, true, false, false));
    }

    function confirmCompletion(uint256 index) external onlyAdmin {
        entries[index].completed = true;
    }

    function sealTrainingEntry(uint256 index) external onlyAdmin {
        require(entries[index].completed, "Must be completed first");
        entries[index].sealed = true;
    }

    function getTrainingEntry(uint256 index) external view returns (TrainingEntry memory) {
        return entries[index];
    }
}
