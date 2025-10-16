// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ChinatownAuditFellowshipDAO {
    address public admin;

    struct AuditEntry {
        string districtName;
        string city;
        string suspectedActivity;
        string emotionalTag;
        bool audited;
        bool flagged;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logAudit(string memory districtName, string memory city, string memory suspectedActivity, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(districtName, city, suspectedActivity, emotionalTag, true, false));
    }

    function flagDistrict(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
