// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AgeLimitGovernanceDAO {
    address public admin;

    struct GovernanceEntry {
        string proposalTitle;
        string jurisdiction;
        string ageThreshold;
        string emotionalTag;
        bool proposed;
        bool ratified;
    }

    GovernanceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function proposeLimit(string memory proposalTitle, string memory jurisdiction, string memory ageThreshold, string memory emotionalTag) external onlyAdmin {
        entries.push(GovernanceEntry(proposalTitle, jurisdiction, ageThreshold, emotionalTag, true, false));
    }

    function ratifyLimit(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function getProposal(uint256 index) external view returns (GovernanceEntry memory) {
        return entries[index];
    }
}
