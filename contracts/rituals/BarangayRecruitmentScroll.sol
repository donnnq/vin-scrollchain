// SPDX-License-Identifier: CivicRecruitment
pragma solidity ^0.8.0;

contract BarangayRecruitmentScroll {
    address public steward;
    uint256 public baseReward = 500; // ₱500 per successful recruit

    struct Recruiter {
        string name;
        string barangay;
        uint256 recruits;
        uint256 bonusSahod;
    }

    mapping(address => Recruiter) public recruiters;
    mapping(address => address) public recruitedBy;
    address[] public allRecruits;

    event RecruiterBlessed(address indexed recruiter, string name, string barangay);
    event CitizenRecruited(address indexed recruiter, address indexed recruit);
    event BonusReleased(address indexed recruiter, uint256 amount);

    constructor() {
        steward = msg.sender;
    }

    function registerRecruiter(string memory name, string memory barangay) public {
        recruiters[msg.sender] = Recruiter(name, barangay, 0, 0);
        emit RecruiterBlessed(msg.sender, name, barangay);
    }

    function recruitCitizen(address recruit) public {
        require(recruiters[msg.sender].recruits < 100, "Recruit limit reached");
        require(recruitedBy[recruit] == address(0), "Already recruited");

        recruitedBy[recruit] = msg.sender;
        recruiters[msg.sender].recruits += 1;
        allRecruits.push(recruit);

        emit CitizenRecruited(msg.sender, recruit);
    }

    function releaseBonus(address recruiter) public {
        require(msg.sender == steward, "Only steward may release bonus");
        uint256 payout = recruiters[recruiter].recruits * baseReward;
        recruiters[recruiter].bonusSahod += payout;
        recruiters[recruiter].recruits = 0;

        emit BonusReleased(recruiter, payout);
    }

    function getRecruiter(address recruiter) public view returns (Recruiter memory) {
        return recruiters[recruiter];
    }

    function totalRecruits() public view returns (uint256) {
        return allRecruits.length;
    }
}
