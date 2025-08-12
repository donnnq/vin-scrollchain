// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinEntryLevelAccess - Ritual contract for inclusive hiring and dignified onboarding
/// @author Vinvin
/// @notice Ensures fair access to entry-level roles for prepared jobseekers
/// @dev Designed for civic employers, mythic HR systems, and dignity-based recruitment

contract vinEntryLevelAccess {
    address public scrollsmith;
    uint256 public totalBlessedEmployers;

    struct Jobseeker {
        string name;
        string field;
        bool hasFormalEducation;
        bool isBlessed;
        uint256 timestamp;
    }

    struct Employer {
        string orgName;
        bool acceptsEntryLevel;
        bool isBlessed;
        uint256 timestamp;
    }

    Jobseeker[] public seekers;
    Employer[] public employers;

    event JobseekerBlessed(string name, string field);
    event EmployerBlessed(string orgName);
    event MatchMade(string seeker, string employer);

    constructor() {
        scrollsmith = msg.sender;
    }

    function blessJobseeker(string memory name, string memory field, bool hasFormalEducation) public {
        seekers.push(Jobseeker(name, field, hasFormalEducation, true, block.timestamp));
        emit JobseekerBlessed(name, field);
    }

    function blessEmployer(string memory orgName, bool acceptsEntryLevel) public {
        require(acceptsEntryLevel, "Employer must accept entry-level applicants");
        employers.push(Employer(orgName, true, true, block.timestamp));
        totalBlessedEmployers += 1;
        emit EmployerBlessed(orgName);
    }

    function match(uint256 seekerIndex, uint256 employerIndex) public {
        require(seekerIndex < seekers.length, "Invalid seeker");
        require(employerIndex < employers.length, "Invalid employer");
        require(seekers[seekerIndex].isBlessed, "Seeker not blessed");
        require(employers[employerIndex].isBlessed, "Employer not blessed");

        emit MatchMade(seekers[seekerIndex].name, employers[employerIndex].orgName);
    }

    function totalSeekers() public view returns (uint256) {
        return seekers.length;
    }

    function totalEmployers() public view returns (uint256) {
        return employers.length;
    }
}
