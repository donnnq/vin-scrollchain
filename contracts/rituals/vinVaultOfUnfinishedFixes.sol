// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinVaultOfUnfinishedFixes {
    address public scrollkeeper;

    struct FixEntry {
        string issueTitle;
        string sector;
        string proposedSolution;
        bool isResolved;
        uint256 timestamp;
    }

    FixEntry[] public fixLog;

    event FixLogged(string issueTitle, string sector);
    event FixResolved(string issueTitle);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logFix(string memory issueTitle, string memory sector, string memory proposedSolution) external onlyScrollkeeper {
        fixLog.push(FixEntry(issueTitle, sector, proposedSolution, false, block.timestamp));
        emit FixLogged(issueTitle, sector);
    }

    function markResolved(uint256 index) external onlyScrollkeeper {
        fixLog[index].isResolved = true;
        emit FixResolved(fixLog[index].issueTitle);
    }

    function getFix(uint256 index) external view returns (string memory, string memory, string memory, bool, uint256) {
        FixEntry memory f = fixLog[index];
        return (f.issueTitle, f.sector, f.proposedSolution, f.isResolved, f.timestamp);
    }

    function totalFixes() external view returns (uint256) {
        return fixLog.length;
    }
}
