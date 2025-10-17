// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InstitutionalReadinessFellowship {
    address public admin;

    struct ReadinessEntry {
        string institutionName;
        string readinessConcern;
        string emotionalTag;
        bool summoned;
        bool reinforced;
    }

    ReadinessEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReadiness(string memory institutionName, string memory readinessConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(ReadinessEntry(institutionName, readinessConcern, emotionalTag, true, false));
    }

    function reinforceReadiness(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getReadiness(uint256 index) external view returns (ReadinessEntry memory) {
        return entries[index];
    }
}
