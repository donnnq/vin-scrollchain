// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KasambahayPriorityLedger {
    address public steward;

    struct ApplicantEntry {
        string applicantName;
        string role; // "Kasambahay", "Solo parent", "Factory worker"
        uint256 monthlyIncome;
        string emotionalTag;
        bool prioritized;
        bool sealed;
    }

    ApplicantEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function prioritizeApplicant(string memory applicantName, string memory role, uint256 monthlyIncome, string memory emotionalTag) external onlySteward {
        require(monthlyIncome <= 8000, "Income exceeds priority threshold");
        entries.push(ApplicantEntry(applicantName, role, monthlyIncome, emotionalTag, true, false));
    }

    function sealApplicantEntry(uint256 index) external onlySteward {
        require(entries[index].prioritized, "Must be prioritized first");
        entries[index].sealed = true;
    }

    function getApplicantEntry(uint256 index) external view returns (ApplicantEntry memory) {
        return entries[index];
    }
}
