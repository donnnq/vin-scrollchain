// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinJobRegistry {
    struct JobPost {
        string country;
        string role;
        string employer;
        uint256 salaryUSD;
        bool verified;
    }

    JobPost[] public jobs;

    function addJob(string memory country, string memory role, string memory employer, uint256 salaryUSD) public {
        jobs.push(JobPost(country, role, employer, salaryUSD, true));
    }

    function getJob(uint index) public view returns (JobPost memory) {
        return jobs[index];
    }

    function totalJobs() public view returns (uint) {
        return jobs.length;
    }
}
