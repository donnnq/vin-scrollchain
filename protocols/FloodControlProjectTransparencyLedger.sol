// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlProjectTransparencyLedger {
    address public steward;

    struct ProjectEntry {
        string projectName;
        string barangay;
        string timestamp;
        uint256 budget;
        string contractor;
        string completionStatus;
        string emotionalTag;
    }

    ProjectEntry[] public ledger;

    event ProjectLogged(string projectName, string barangay, string timestamp, uint256 budget, string contractor, string completionStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logProject(
        string memory projectName,
        string memory barangay,
        string memory timestamp,
        uint256 budget,
        string memory contractor,
        string memory completionStatus,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ProjectEntry(projectName, barangay, timestamp, budget, contractor, completionStatus, emotionalTag));
        emit ProjectLogged(projectName, barangay, timestamp, budget, contractor, completionStatus, emotionalTag);
    }
}
