// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlAuditCodex {
    address public admin;

    struct AuditEntry {
        string projectLabel;
        string anomalyDetail;
        string emotionalTag;
        bool verified;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory projectLabel, string memory anomalyDetail, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(projectLabel, anomalyDetail, emotionalTag, false));
    }

    function verifyEntry(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
