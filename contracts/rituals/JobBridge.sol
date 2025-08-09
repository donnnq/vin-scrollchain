// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract JobBridge {
    address public deployer;

    struct Job {
        string title;
        string location;
        string typeOfWork; // Local or Overseas
        string requiredSkill;
        address recruiter;
        bool isOpen;
    }

    Job[] public jobs;

    event JobPosted(string title, string location, string typeOfWork);
    event ApplicationSubmitted(address applicant, uint256 jobId);

    constructor() {
        deployer = msg.sender;
    }

    function postJob(string calldata title, string calldata location, string calldata typeOfWork, string calldata requiredSkill) external {
        jobs.push(Job(title, location, typeOfWork, requiredSkill, msg.sender, true));
        emit JobPosted(title, location, typeOfWork);
    }

    function applyToJob(uint256 jobId) external {
        require(jobs[jobId].isOpen, "Job closed");
        emit ApplicationSubmitted(msg.sender, jobId);
    }

    function getJob(uint256 jobId) external view returns (Job memory) {
        return jobs[jobId];
    }

    function closeJob(uint256 jobId) external {
        require(msg.sender == jobs[jobId].recruiter, "Not authorized");
        jobs[jobId].isOpen = false;
    }
}
