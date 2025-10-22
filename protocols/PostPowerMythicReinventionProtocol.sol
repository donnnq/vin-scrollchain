// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PostPowerMythicReinventionProtocol {
    address public admin;

    struct ReinventionEntry {
        string individualName;
        string formerRole;
        string newPath; // "Exploring new things", "Private life", "Civic engagement"
        string emotionalTag;
        bool initiated;
        bool sealed;
    }

    ReinventionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateReinvention(string memory individualName, string memory formerRole, string memory newPath, string memory emotionalTag) external onlyAdmin {
        entries.push(ReinventionEntry(individualName, formerRole, newPath, emotionalTag, true, false));
    }

    function sealReinventionEntry(uint256 index) external onlyAdmin {
        require(entries[index].initiated, "Must be initiated first");
        entries[index].sealed = true;
    }

    function getReinventionEntry(uint256 index) external view returns (ReinventionEntry memory) {
        return entries[index];
    }
}
