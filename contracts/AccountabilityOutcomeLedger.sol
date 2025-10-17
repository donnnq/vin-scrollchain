// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccountabilityOutcomeLedger {
    address public admin;

    struct OutcomeEntry {
        string caseTitle;
        string verdict;
        string emotionalTag;
        bool logged;
        bool enforced;
    }

    OutcomeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logOutcome(string memory caseTitle, string memory verdict, string memory emotionalTag) external onlyAdmin {
        entries.push(OutcomeEntry(caseTitle, verdict, emotionalTag, true, false));
    }

    function enforceOutcome(uint256 index) external onlyAdmin {
        entries[index].enforced = true;
    }

    function getOutcomeEntry(uint256 index) external view returns (OutcomeEntry memory) {
        return entries[index];
    }
}
