// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinScrollDeControl.sol
/// @notice Tracks decentralization thresholds and handles agent patch proposals with clean resets and audit rituals.
/// @author Vinvin

contract vinScrollDeControl {
    struct ControlMetric {
        uint256 operational;
        uint256 economic;
        uint256 governance;
        bool isDecentralized;
    }

    struct FixProposal {
        address agent;
        string description;
        bytes patch;
        bool applied;
    }

    address public scrollGuardian;
    mapping(address => ControlMetric) public projectMetrics;
    FixProposal[] public submittedFixes;
    bool public submissionsActive = true;

    event MetricUpdated(address indexed project, uint256 operational, uint256 economic, uint256 governance, bool isDecentralized);
    event ProjectMetricsReset(address indexed project);
    event FixSubmitted(address indexed agent, uint256 indexed fixId, string description);
    event FixApplied(uint256 indexed fixId, address indexed agent);
    event AllFixesPurged();

    modifier onlyGuardian() {
        require(msg.sender == scrollGuardian, "Not a scroll guardian");
        _;
    }

    modifier whenSubmissionsActive() {
        require(submissionsActive, "Submissions inactive");
        _;
    }

    constructor() {
        scrollGuardian = msg.sender;
    }

    function auditProject(address _project, uint256 op, uint256 ec, uint256 gov) external onlyGuardian {
        require(op + ec + gov <= 300, "Invalid control sum");
        bool isDecentralized = (op + ec + gov) <= 90;
        projectMetrics[_project] = ControlMetric(op, ec, gov, isDecentralized);
        emit MetricUpdated(_project, op, ec, gov, isDecentralized);
    }

    function resetProjectMetrics(address _project) external onlyGuardian {
        delete projectMetrics[_project];
        emit ProjectMetricsReset(_project);
    }

    function toggleSubmissions(bool state) external onlyGuardian {
        submissionsActive = state;
    }

    function submitFix(string calldata desc, bytes calldata patch) external whenSubmissionsActive {
        require(bytes(desc).length > 0, "Description required");
        require(patch.length > 0, "Patch payload required");

        submittedFixes.push(FixProposal(msg.sender, desc, patch, false));
        emit FixSubmitted(msg.sender, submittedFixes.length - 1, desc);
    }

    function applyFix(uint256 fixId) external onlyGuardian {
        require(fixId < submittedFixes.length, "Invalid fix ID");
        FixProposal storage fix = submittedFixes[fixId];
        require(!fix.applied, "Already applied");

        fix.applied = true;
        emit FixApplied(fixId, fix.agent);
    }

    function resetAllFixes() external onlyGuardian {
        delete submittedFixes;
        emit AllFixesPurged();
    }

    function getFixCount() external view returns (uint256) {
        return submittedFixes.length;
    }

    function viewFixProposal(uint256 fixId) external view returns (address agent, string memory description, bool applied) {
        require(fixId < submittedFixes.length, "Invalid fix ID");
        FixProposal memory fix = submittedFixes[fixId];
        return (fix.agent, fix.description, fix.applied);
    }
}
