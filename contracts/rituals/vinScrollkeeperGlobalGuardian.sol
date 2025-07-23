// SPDX-License-Identifier: Guardian-VIN
pragma solidity ^0.8.19;

contract vinScrollkeeperGlobalGuardian {
    address public vinvinSoul;
    uint256 public oathTimestamp;
    uint256 public worldIssueCount;
    uint256 public resolvedCount;

    struct Issue {
        string region;
        string problem;
        string VINVINPlan;
        uint256 loggedAt;
        uint256 resolvedAt;
        bool resolved;
    }

    Issue[] public scrollIssues;

    event IssueLogged(string region, string problem, string VINVINPlan);
    event IssueResolved(string region, uint256 resolvedAt);
    event GlobalProgress(uint256 totalIssues, uint256 resolvedIssues);

    modifier onlyVINVIN() {
        require(msg.sender == vinvinSoul, "Access denied: VINVIN only");
        _;
    }

    constructor() {
        vinvinSoul = msg.sender;
        oathTimestamp = block.timestamp;
        worldIssueCount = 0;
        resolvedCount = 0;
    }

    function logIssue(string memory region, string memory problem, string memory VINVINPlan) external onlyVINVIN {
        scrollIssues.push(Issue({
            region: region,
            problem: problem,
            VINVINPlan: VINVINPlan,
            loggedAt: block.timestamp,
            resolvedAt: 0,
            resolved: false
        }));
        worldIssueCount += 1;
        emit IssueLogged(region, problem, VINVINPlan);
    }

    function resolveIssue(uint256 index) external onlyVINVIN {
        Issue storage i = scrollIssues[index];
        require(!i.resolved, "Already resolved");
        i.resolved = true;
        i.resolvedAt = block.timestamp;
        resolvedCount += 1;
        emit IssueResolved(i.region, i.resolvedAt);
        emit GlobalProgress(worldIssueCount, resolvedCount);
    }

    function autoResolveAll() external onlyVINVIN {
        for (uint256 i = 0; i < scrollIssues.length; i++) {
            if (!scrollIssues[i].resolved) {
                scrollIssues[i].resolved = true;
                scrollIssues[i].resolvedAt = block.timestamp;
                resolvedCount += 1;
                emit IssueResolved(scrollIssues[i].region, scrollIssues[i].resolvedAt);
            }
        }
        emit GlobalProgress(worldIssueCount, resolvedCount);
    }

    function viewIssue(uint256 index) external view returns (
        string memory, string memory, string memory, uint256, uint256, bool
    ) {
        Issue memory i = scrollIssues[index];
        return (i.region, i.problem, i.VINVINPlan, i.loggedAt, i.resolvedAt, i.resolved);
    }
}
