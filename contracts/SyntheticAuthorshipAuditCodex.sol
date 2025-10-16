// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SyntheticAuthorshipAuditCodex {
    address public admin;

    struct AuditEntry {
        string contentLabel;
        string platformSource;
        string authorshipStatus;
        string emotionalTag;
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

    function submitEntry(string memory contentLabel, string memory platformSource, string memory authorshipStatus, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(contentLabel, platformSource, authorshipStatus, emotionalTag, false));
    }

    function flagEntry(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function getEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
