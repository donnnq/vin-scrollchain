// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LocalHiringPriorityAuditDAO {
    address public admin;

    struct HiringEntry {
        string region;
        string jobType;
        string emotionalTag;
        bool summoned;
        bool fulfilled;
    }

    HiringEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonHiring(string memory region, string memory jobType, string memory emotionalTag) external onlyAdmin {
        entries.push(HiringEntry(region, jobType, emotionalTag, true, false));
    }

    function fulfillHiring(uint256 index) external onlyAdmin {
        entries[index].fulfilled = true;
    }

    function getHiringEntry(uint256 index) external view returns (HiringEntry memory) {
        return entries[index];
    }
}
