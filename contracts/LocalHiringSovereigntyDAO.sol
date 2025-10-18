// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LocalHiringSovereigntyDAO {
    address public admin;

    struct HiringEntry {
        string communityName;
        string jobType;
        string emotionalTag;
        bool summoned;
        bool prioritized;
    }

    HiringEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonHiring(string memory communityName, string memory jobType, string memory emotionalTag) external onlyAdmin {
        entries.push(HiringEntry(communityName, jobType, emotionalTag, true, false));
    }

    function prioritizeHiring(uint256 index) external onlyAdmin {
        entries[index].prioritized = true;
    }

    function getHiringEntry(uint256 index) external view returns (HiringEntry memory) {
        return entries[index];
    }
}
