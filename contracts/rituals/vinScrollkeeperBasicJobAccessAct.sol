// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinScrollkeeperBasicJobAccessAct {
    address public scrollkeeper;

    struct JobPost {
        string jobTitle;
        string location;
        bool isLaborCategory;
        bool resumeOnly;
        uint256 timestamp;
    }

    JobPost[] public jobPosts;

    event JobSimplified(string jobTitle, string location);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function postJob(string memory jobTitle, string memory location, bool isLaborCategory) external onlyScrollkeeper {
        jobPosts.push(JobPost(jobTitle, location, isLaborCategory, isLaborCategory, block.timestamp));
        emit JobSimplified(jobTitle, location);
    }

    function getJob(uint256 index) external view returns (string memory, string memory, bool, bool, uint256) {
        JobPost memory j = jobPosts[index];
        return (j.jobTitle, j.location, j.isLaborCategory, j.resumeOnly, j.timestamp);
    }

    function totalJobs() external view returns (uint256) {
        return jobPosts.length;
    }
}
