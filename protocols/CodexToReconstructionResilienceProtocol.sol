// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToReconstructionResilienceProtocol {
    string public batchID = "1321.9.106";
    string public steward = "Vinvin";

    address public admin;

    struct Lesson {
        string projectName;
        string insight;
        uint256 timestamp;
    }

    Lesson[] public lessons;

    event LessonSealed(string projectName, string insight);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function sealLesson(string memory projectName, string memory insight) public onlyAdmin {
        lessons.push(Lesson(projectName, insight, block.timestamp));
        emit LessonSealed(projectName, insight);
    }

    function getLesson(uint256 index) public view returns (string memory projectName, string memory insight, uint256 timestamp) {
        Lesson memory l = lessons[index];
        return (l.projectName, l.insight, l.timestamp);
    }
}
