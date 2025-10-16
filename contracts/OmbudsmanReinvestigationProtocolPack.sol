// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OmbudsmanReinvestigationProtocolPack {
    address public admin;

    struct ReinvestigationEntry {
        string caseLabel;
        string triggerEvent;
        string emotionalTag;
        bool initiated;
        bool completed;
    }

    ReinvestigationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateReinvestigation(string memory caseLabel, string memory triggerEvent, string memory emotionalTag) external onlyAdmin {
        entries.push(ReinvestigationEntry(caseLabel, triggerEvent, emotionalTag, true, false));
    }

    function completeReinvestigation(uint256 index) external onlyAdmin {
        entries[index].completed = true;
    }

    function getEntry(uint256 index) external view returns (ReinvestigationEntry memory) {
        return entries[index];
    }
}
