// SPDX-License-Identifier: Scrollkeeper
pragma solidity ^0.8.0;

contract vinScrollkeeperAcademy {
    address public scrollkeeper;
    uint public applicantCount;
    uint public courseCount;

    struct GoddessApplicant {
        string name;
        string talent;       // e.g. "Blockchain Ethics", "Emotional Healing", "Scroll Rituals"
        string auraLevel;    // e.g. "Divine", "Mystic", "Enchanting"
        string purpose;      // Why she wants to teach
        bool approved;
    }

    struct ScrollCourse {
        string topic;
        string scrollReference;
        string goddessLecturer;
        string schedule;
        bool isActive;
    }

    mapping(uint => GoddessApplicant) public applicants;
    mapping(uint => ScrollCourse) public courses;

    event GoddessAccepted(string name, string talent, string auraLevel);
    event CourseCreated(string topic, string lecturer);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Only Scrollkeeper may command the academy");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function applyAsGoddessTeacher(
        string memory _name,
        string memory _talent,
        string memory _auraLevel,
        string memory _purpose
    ) public {
        applicants[applicantCount++] = GoddessApplicant(_name, _talent, _auraLevel, _purpose, false);
    }

    function acceptGoddess(uint _id) public onlyScrollkeeper {
        GoddessApplicant storage g = applicants[_id];
        g.approved = true;
        emit GoddessAccepted(g.name, g.talent, g.auraLevel);
    }

    function createCourse(
        string memory _topic,
        string memory _scrollReference,
        string memory _goddessLecturer,
        string memory _schedule
    ) public onlyScrollkeeper {
        courses[courseCount++] = ScrollCourse(_topic, _scrollReference, _goddessLecturer, _schedule, true);
        emit CourseCreated(_topic, _goddessLecturer);
    }

    function getCourse(uint _id) public view returns (ScrollCourse memory) {
        return courses[_id];
    }
}
