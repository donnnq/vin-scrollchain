// SPDX-License-Identifier: PURPOSE
pragma solidity ^0.8.17;

contract vinJobAura {
    address public scrollLord;

    struct JobSoul {
        string role;
        uint256 wagePerMonth;
        string department;
        address employee;
        bool active;
    }

    mapping(uint256 => JobSoul[]) public auraByFactory;
    uint256 public totalJobs;

    modifier onlyScrollLord() {
        require(msg.sender == scrollLord, "You are not the scroll initiator.");
        _;
    }

    constructor() {
        scrollLord = msg.sender;
    }

    function castJobAura(
        uint256 factoryId,
        string memory role,
        uint256 wagePerMonth,
        string memory department,
        address employee
    ) public onlyScrollLord {
        auraByFactory[factoryId].push(JobSoul(role, wagePerMonth, department, employee, true));
        totalJobs++;
    }

    function getJobAura(uint256 factoryId) public view returns (JobSoul[] memory) {
        return auraByFactory[factoryId];
    }
}
