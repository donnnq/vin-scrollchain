// SPDX-License-Identifier: Scrollkeeper
pragma solidity ^0.8.0;

contract vinScrollClassroom {
    address public scrollkeeper;
    uint public classCount;

    struct ScrollClass {
        string topic;
        string scrollReference;
        string explainerName;
        string schedule; // e.g. "Every Friday 3PM"
        uint enrolled;
    }

    mapping(uint => ScrollClass) public classes;
    mapping(address => uint[]) public studentEnrollments;

    event ClassCreated(string topic, string explainer, string schedule);
    event StudentEnrolled(address student, string topic);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Only Scrollkeeper can create classes");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function createClass(
        string memory _topic,
        string memory _scrollReference,
        string memory _explainerName,
        string memory _schedule
    ) public onlyScrollkeeper {
        classes[classCount++] = ScrollClass(_topic, _scrollReference, _explainerName, _schedule, 0);
        emit ClassCreated(_topic, _explainerName, _schedule);
    }

    function enroll(uint _classId) public {
        require(_classId < classCount, "Class does not exist");
        classes[_classId].enrolled++;
        studentEnrollments[msg.sender].push(_classId);
        emit StudentEnrolled(msg.sender, classes[_classId].topic);
    }

    function getMyClasses(address _student) public view returns (uint[] memory) {
        return studentEnrollments[_student];
    }
}
