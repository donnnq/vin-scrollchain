// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TomahawkRejectionAuditDAO {
    address public admin;

    struct RejectionEntry {
        string requester;
        string reason;
        string emotionalTag;
        bool summoned;
        bool resolved;
    }

    RejectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRejection(string memory requester, string memory reason, string memory emotionalTag) external onlyAdmin {
        entries.push(RejectionEntry(requester, reason, emotionalTag, true, false));
    }

    function resolveRejection(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getRejectionEntry(uint256 index) external view returns (RejectionEntry memory) {
        return entries[index];
    }
}
