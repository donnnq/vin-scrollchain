// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HealthcareEquityCodex {
    address public admin;

    struct EquityEntry {
        string patientGroup;
        string region;
        string issueType;
        string emotionalTag;
        bool addressed;
        bool archived;
    }

    EquityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logIssue(string memory patientGroup, string memory region, string memory issueType, string memory emotionalTag) external onlyAdmin {
        entries.push(EquityEntry(patientGroup, region, issueType, emotionalTag, false, false));
    }

    function markAddressed(uint256 index) external onlyAdmin {
        entries[index].addressed = true;
    }

    function archiveIssue(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getIssue(uint256 index) external view returns (EquityEntry memory) {
        return entries[index];
    }
}
