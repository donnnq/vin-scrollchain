// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LaborSovereigntyTribunalBroadcast {
    address public admin;

    struct TribunalEntry {
        string caseTitle;
        string country;
        string violationType; // e.g., "forced labor", "religious suppression"
        string emotionalTag;
        bool aired;
        bool archived;
    }

    TribunalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTribunal(string memory caseTitle, string memory country, string memory violationType, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(caseTitle, country, violationType, emotionalTag, false, false));
    }

    function airTribunal(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function archiveTribunal(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getTribunal(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
