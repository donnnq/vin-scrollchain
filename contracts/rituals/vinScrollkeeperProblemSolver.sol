// SPDX-License-Identifier: VINVIN-GlobalFixer-v1
pragma solidity ^0.8.24;

/// @title vinScrollkeeperProblemSolver
/// @notice Identifies world problems and logs scrollkeeper-grade solutions
contract vinScrollkeeperProblemSolver {
    address public scrollkeeper;

    struct ProblemSolution {
        string problem;
        string proposedSolution;
        string emojiImpact;
        bool scrollkeeperApproved;
        uint256 timestamp;
    }

    mapping(string => ProblemSolution) public solutionLog;
    string[] public solvedProblems;

    event ProblemSolved(string indexed problem, string solution, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function solveProblem(
        string calldata problem,
        string calldata solution,
        string calldata emoji,
        bool approved
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may solve world problems");
        solutionLog[problem] = ProblemSolution(problem, solution, emoji, approved, block.timestamp);
        solvedProblems.push(problem);
        emit ProblemSolved(problem, solution, emoji);
    }

    function viewSolution(string calldata problem) external view returns (
        string memory solution,
        string memory emoji,
        bool approved,
        uint256 time
    ) {
        ProblemSolution memory s = solutionLog[problem];
        return (s.proposedSolution, s.emojiImpact, s.scrollkeeperApproved, s.timestamp);
    }

    function allSolvedProblems() external view returns (string[] memory) {
        return solvedProblems;
    }
}
