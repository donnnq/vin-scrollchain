// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthLearningConditionIndex {
    address public admin;

    struct ConditionEntry {
        string region;
        string conditionLayer; // "Overcrowding", "Lack of Facilities", "Rotational Attendance"
        uint256 affectedStudents;
        string emotionalTag;
        bool summoned;
        bool scored;
        bool sealed;
    }

    ConditionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCondition(string memory region, string memory conditionLayer, uint256 affectedStudents, string memory emotionalTag) external onlyAdmin {
        entries.push(ConditionEntry(region, conditionLayer, affectedStudents, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealConditionEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getConditionEntry(uint256 index) external view returns (ConditionEntry memory) {
        return entries[index];
    }
}
