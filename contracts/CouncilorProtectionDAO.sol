// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CouncilorProtectionDAO {
    address public admin;

    struct ProtectionEntry {
        string councilorName;
        string incidentType;
        string protectionClause;
        string emotionalTag;
        bool activated;
    }

    ProtectionEntry[] public protections;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _councilorName, string memory _incidentType, string memory _protectionClause, string memory _emotionalTag) external onlyAdmin {
        protections.push(ProtectionEntry(_councilorName, _incidentType, _protectionClause, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        protections[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return protections[index];
    }
}
