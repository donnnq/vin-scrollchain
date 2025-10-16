// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConflictOfInterestAuditCodex {
    address public admin;

    struct ConflictEntry {
        string contractorName;
        string conflictDetail;
        string emotionalTag;
        bool flagged;
    }

    ConflictEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory contractorName, string memory conflictDetail, string memory emotionalTag) external onlyAdmin {
        entries.push(ConflictEntry(contractorName, conflictDetail, emotionalTag, false));
    }

    function flagEntry(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function getEntry(uint256 index) external view returns (ConflictEntry memory) {
        return entries[index];
    }
}
