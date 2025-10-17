// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DPWHAdvisorRegistry {
    address public admin;

    struct AdvisorEntry {
        string advisorName;
        string specialty;
        string emotionalTag;
        bool registered;
        bool active;
    }

    AdvisorEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerAdvisor(string memory advisorName, string memory specialty, string memory emotionalTag) external onlyAdmin {
        entries.push(AdvisorEntry(advisorName, specialty, emotionalTag, true, false));
    }

    function activateAdvisor(uint256 index) external onlyAdmin {
        entries[index].active = true;
    }

    function getAdvisor(uint256 index) external view returns (AdvisorEntry memory) {
        return entries[index];
    }
}
