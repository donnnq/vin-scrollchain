// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinWorkerGuardianNode {
    struct Report {
        address worker;
        string issue;
        uint256 timestamp;
    }

    Report[] public reports;

    function submitReport(string memory issue) public {
        reports.push(Report(msg.sender, issue, block.timestamp));
    }

    function getReport(uint index) public view returns (Report memory) {
        return reports[index];
    }

    function totalReports() public view returns (uint) {
        return reports.length;
    }
}
