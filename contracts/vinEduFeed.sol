// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinEduFeed {
    address public scrollsmith;
    uint public feedCount;

    struct EduFeed {
        string subject;
        string gradeLevel;
        string broadcastChannel;
        string topicHighlight;
        bool isVerifiedPublicUse;
    }

    mapping(uint => EduFeed) public dailyFeed;
    
    event FeedUploaded(string subject, string gradeLevel, string broadcastChannel, string topicHighlight);
    event ScrollsmithTransferred(address oldScrollsmith, address newScrollsmith);

    constructor() {
        scrollsmith = msg.sender;
        feedCount = 0;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Only the scrollsmith can curate the edu-feed.");
        _;
    }

    // 📚 Upload a broadcast-aligned lesson feed
    function uploadFeed(
        string memory subject,
        string memory gradeLevel,
        string memory broadcastChannel,
        string memory topicHighlight,
        bool isVerifiedPublicUse
    ) public onlyScrollsmith {
        dailyFeed[feedCount++] = EduFeed(subject, gradeLevel, broadcastChannel, topicHighlight, isVerifiedPublicUse);
        emit FeedUploaded(subject, gradeLevel, broadcastChannel, topicHighlight);
    }

    // 📺 Retrieve specific lesson feed metadata
    function getFeed(uint id) public view returns (
        string memory subject,
        string memory gradeLevel,
        string memory broadcastChannel,
        string memory topicHighlight,
        bool isVerifiedPublicUse
    ) {
        EduFeed memory feed = dailyFeed[id];
        return (
            feed.subject,
            feed.gradeLevel,
            feed.broadcastChannel,
            feed.topicHighlight,
            feed.isVerifiedPublicUse
        );
    }

    // 🧙 Transfer the scrollsmith role
    function transferScrollsmith(address newScrollsmith) public onlyScrollsmith {
        require(newScrollsmith != address(0), "Invalid scrollsmith address.");
        emit ScrollsmithTransferred(scrollsmith, newScrollsmith);
        scrollsmith = newScrollsmith;
    }

    // 🎓 View total feeds uploaded
    function totalFeeds() public view returns (uint) {
        return feedCount;
    }
}
