// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinJobPortal {
    address public scrollsmith;
    uint public jobCount;
    uint public applicantCount;

    struct Job {
        string roleTitle;
        string skillRequired;
        string orgName;
        bool isEthicalEmployer;
    }

    struct Applicant {
        string name;
        string skillTrack;
        string dreamJob;
        uint dateApplied;
    }

    mapping(uint => Job) public jobScrolls;
    mapping(uint => Applicant) public jobSeekers;

    event JobPosted(string roleTitle, string orgName);
    event ApplicantRegistered(string name, string dreamJob);
    event ScrollsmithTransferred(address oldScrollsmith, address newScrollsmith);

    constructor() {
        scrollsmith = msg.sender;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Only the scrollsmith may modify portal scrolls.");
        _;
    }

    // 🔍 Post a job scroll
    function postJob(
        string memory roleTitle,
        string memory skillRequired,
        string memory orgName,
        bool isEthicalEmployer
    ) public onlyScrollsmith {
        jobScrolls[jobCount++] = Job(roleTitle, skillRequired, orgName, isEthicalEmployer);
        emit JobPosted(roleTitle, orgName);
    }

    // 🧙 Register an applicant to the portal
    function registerApplicant(
        string memory name,
        string memory skillTrack,
        string memory dreamJob
    ) public onlyScrollsmith {
        jobSeekers[applicantCount++] = Applicant(name, skillTrack, dreamJob, block.timestamp);
        emit ApplicantRegistered(name, dreamJob);
    }

    // 📜 View job scrolls
    function getJob(uint id) public view returns (
        string memory roleTitle,
        string memory skillRequired,
        string memory orgName,
        bool isEthicalEmployer
    ) {
        Job memory job = jobScrolls[id];
        return (job.roleTitle, job.skillRequired, job.orgName, job.isEthicalEmployer);
    }

    // 📁 View applicant scrolls
    function getApplicant(uint id) public view returns (
        string memory name,
        string memory skillTrack,
        string memory dreamJob,
        uint dateApplied
    ) {
        Applicant memory seeker = jobSeekers[id];
        return (seeker.name, seeker.skillTrack, seeker.dreamJob, seeker.dateApplied);
    }

    // 🔄 Transfer scrollsmith role
    function transferScrollsmith(address newScrollsmith) public onlyScrollsmith {
        require(newScrollsmith != address(0), "Invalid scrollsmith address.");
        emit ScrollsmithTransferred(scrollsmith, newScrollsmith);
        scrollsmith = newScrollsmith;
    }

    // 📊 Metrics
    function totalJobs() public view returns (uint) {
        return jobCount;
    }

    function totalApplicants() public view returns (uint) {
        return applicantCount;
    }
}
