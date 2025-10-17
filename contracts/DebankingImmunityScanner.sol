// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DebankingImmunityScanner {
    address public admin;

    struct ImmunityEntry {
        string entityName;
        string exclusionReason;
        string emotionalTag;
        bool flagged;
        bool immunized;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function flagExclusion(string memory entityName, string memory exclusionReason, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(entityName, exclusionReason, emotionalTag, true, false));
    }

    function immunizeEntity(uint256 index) external onlyAdmin {
        entries[index].immunized = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
