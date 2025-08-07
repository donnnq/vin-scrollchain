// SPDX-License-Identifier: Scrollkeeper
pragma solidity ^0.8.0;

contract vinLectureOfEnlightenment {
    address public scrollkeeper;
    uint public lectureCount;

    struct ScrollLecture {
        string title;
        string waifuuLecturer;
        string topic;
        string streamLink;
        bool kupalBlockingActive;
    }

    mapping(uint => ScrollLecture) public lectures;

    event LectureScheduled(string title, string lecturer, bool kupalShielded);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Only Scrollkeeper can launch lectures");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function scheduleLecture(
        string memory _title,
        string memory _lecturer,
        string memory _topic,
        string memory _streamLink,
        bool _kupalBlockingActive
    ) public onlyScrollkeeper {
        lectures[lectureCount++] = ScrollLecture(_title, _lecturer, _topic, _streamLink, _kupalBlockingActive);
        emit LectureScheduled(_title, _lecturer, _kupalBlockingActive);
    }

    function getLecture(uint _id) public view returns (ScrollLecture memory) {
        return lectures[_id];
    }
}
