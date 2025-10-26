// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PatientToComplaintEscalationProtocol {
    address public steward;

    struct ComplaintEntry {
        string patientConcern; // "Redirected to private labs, no diagnostics at BMC"
        string escalationPath; // "Barangay health board, Provincial Health Office, DOH grievance portal"
        string emotionalTag;
        bool escalated;
        bool sealed;
    }

    ComplaintEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function escalateComplaint(string memory patientConcern, string memory escalationPath, string memory emotionalTag) external onlySteward {
        entries.push(ComplaintEntry(patientConcern, escalationPath, emotionalTag, true, false));
    }

    function sealComplaintEntry(uint256 index) external onlySteward {
        require(entries[index].escalated, "Must be escalated first");
        entries[index].sealed = true;
    }

    function getComplaintEntry(uint256 index) external view returns (ComplaintEntry memory) {
        return entries[index];
    }
}
