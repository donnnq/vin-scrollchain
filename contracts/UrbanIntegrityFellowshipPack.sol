// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanIntegrityFellowshipPack {
    address public admin;

    struct FellowshipEntry {
        string districtName;
        string city;
        string auditType;
        string emotionalTag;
        bool activated;
        bool completed;
    }

    FellowshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function activateAudit(string memory districtName, string memory city, string memory auditType, string memory emotionalTag) external onlyAdmin {
        entries.push(FellowshipEntry(districtName, city, auditType, emotionalTag, true, false));
    }

    function markCompleted(uint256 index) external onlyAdmin {
        entries[index].completed = true;
    }

    function getFellowship(uint256 index) external view returns (FellowshipEntry memory) {
        return entries[index];
    }
}
