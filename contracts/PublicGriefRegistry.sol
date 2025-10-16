// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicGriefRegistry {
    address public admin;

    struct GriefEntry {
        string grievanceLabel;
        string emotionalTag;
        string civicContext;
        bool archived;
    }

    GriefEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitGrief(string memory grievanceLabel, string memory emotionalTag, string memory civicContext) external onlyAdmin {
        entries.push(GriefEntry(grievanceLabel, emotionalTag, civicContext, false));
    }

    function archiveGrief(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getGrief(uint256 index) external view returns (GriefEntry memory) {
        return entries[index];
    }
}
