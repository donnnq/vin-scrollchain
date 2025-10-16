// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FootageRetentionImmunityPack {
    address public admin;

    struct RetentionEntry {
        string footageLabel;
        string retentionClause;
        string emotionalTag;
        bool locked;
    }

    RetentionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory footageLabel, string memory retentionClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RetentionEntry(footageLabel, retentionClause, emotionalTag, false));
    }

    function lockEntry(uint256 index) external onlyAdmin {
        entries[index].locked = true;
    }

    function getEntry(uint256 index) external view returns (RetentionEntry memory) {
        return entries[index];
    }
}
