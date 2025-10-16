// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateHealthTransparencyCodex {
    address public admin;

    struct HealthEntry {
        string officialName;
        string incidentDate;
        string incidentType;
        string emotionalTag;
        bool disclosed;
        bool reviewed;
    }

    HealthEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logIncident(string memory officialName, string memory incidentDate, string memory incidentType, string memory emotionalTag) external onlyAdmin {
        entries.push(HealthEntry(officialName, incidentDate, incidentType, emotionalTag, true, false));
    }

    function markReviewed(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function getIncident(uint256 index) external view returns (HealthEntry memory) {
        return entries[index];
    }
}
