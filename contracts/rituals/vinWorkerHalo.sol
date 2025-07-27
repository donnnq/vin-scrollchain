// SPDX-License-Identifier: DIGNITY
pragma solidity ^0.8.17;

contract vinWorkerHalo {
    address public scrollLord;

    struct WorkerPerformance {
        address employee;
        uint256 productivityScore;
        uint256 teamworkScore;
        uint256 impactScore;
        bool haloCrowned;
        uint256 bonusCompensation;
    }

    mapping(uint256 => WorkerPerformance[]) public haloByMonth;
    uint256 public currentMonth;

    event HaloCrowned(address indexed employee, uint256 month, uint256 bonus);

    modifier onlyScrollLord() {
        require(msg.sender == scrollLord, "Only scrollLord may crown halos.");
        _;
    }

    constructor() {
        scrollLord = msg.sender;
    }

    function crownHalo(
        address employee,
        uint256 productivityScore,
        uint256 teamworkScore,
        uint256 impactScore,
        uint256 bonusCompensation
    ) public onlyScrollLord {
        haloByMonth[currentMonth].push(
            WorkerPerformance(employee, productivityScore, teamworkScore, impactScore, true, bonusCompensation)
        );
        emit HaloCrowned(employee, currentMonth, bonusCompensation);
    }

    function viewHaloedWorkers(uint256 month) public view returns (WorkerPerformance[] memory) {
        return haloByMonth[month];
    }

    function scrollNextMonth() public onlyScrollLord {
        currentMonth++;
    }
}
