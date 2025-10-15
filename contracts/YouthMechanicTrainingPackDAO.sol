// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthMechanicTrainingPackDAO {
    address public admin;

    struct TrainingEntry {
        string ageGroup;
        string mechanicSkill;
        string deliveryMethod;
        string emotionalTag;
        bool deployed;
    }

    TrainingEntry[] public training;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTraining(string memory _ageGroup, string memory _mechanicSkill, string memory _deliveryMethod, string memory _emotionalTag) external onlyAdmin {
        training.push(TrainingEntry(_ageGroup, _mechanicSkill, _deliveryMethod, _emotionalTag, false));
    }

    function deployTraining(uint256 index) external onlyAdmin {
        training[index].deployed = true;
    }

    function getTraining(uint256 index) external view returns (TrainingEntry memory) {
        return training[index];
    }
}
