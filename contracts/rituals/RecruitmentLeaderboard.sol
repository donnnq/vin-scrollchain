pragma solidity ^0.8.0;

contract RecruitmentLeaderboard {
    mapping(address => uint256) public recruitCounts;
    address[] public recruiters;

    event RecruitLogged(address indexed recruiter, uint256 totalRecruits);

    function logRecruit(address recruiter) public {
        if (recruitCounts[recruiter] == 0) {
            recruiters.push(recruiter);
        }
        recruitCounts[recruiter] += 1;
        emit RecruitLogged(recruiter, recruitCounts[recruiter]);
    }

    function getTopRecruiter() public view returns (address) {
        address top;
        uint256 max = 0;
        for (uint i = 0; i < recruiters.length; i++) {
            if (recruitCounts[recruiters[i]] > max) {
                max = recruitCounts[recruiters[i]];
                top = recruiters[i];
            }
        }
        return top;
    }

    function getRecruitCount(address recruiter) public view returns (uint256) {
        return recruitCounts[recruiter];
    }
}
