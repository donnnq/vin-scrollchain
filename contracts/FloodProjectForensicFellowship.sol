// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodProjectForensicFellowship {
    address public admin;

    struct FellowshipEntry {
        string projectName;
        string region;
        string anomalyType;
        string emotionalTag;
        bool investigated;
        bool resolved;
    }

    FellowshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logInvestigation(string memory projectName, string memory region, string memory anomalyType, string memory emotionalTag) external onlyAdmin {
        entries.push(FellowshipEntry(projectName, region, anomalyType, emotionalTag, true, false));
    }

    function markResolved(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getFellowship(uint256 index) external view returns (FellowshipEntry memory) {
        return entries[index];
    }
}
