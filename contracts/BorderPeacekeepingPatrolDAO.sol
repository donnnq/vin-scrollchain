// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BorderPeacekeepingPatrolDAO {
    address public admin;

    struct PatrolEntry {
        string region;
        string patrolType;
        string emotionalTag;
        bool deployed;
        bool verified;
    }

    PatrolEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployPatrol(string memory region, string memory patrolType, string memory emotionalTag) external onlyAdmin {
        entries.push(PatrolEntry(region, patrolType, emotionalTag, true, false));
    }

    function verifyPatrol(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getPatrolEntry(uint256 index) external view returns (PatrolEntry memory) {
        return entries[index];
    }
}
