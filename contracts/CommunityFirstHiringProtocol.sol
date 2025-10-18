// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommunityFirstHiringProtocol {
    address public admin;

    struct HiringEntry {
        string communityName;
        string jobSector;
        string emotionalTag;
        bool summoned;
        bool activated;
    }

    HiringEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonHiring(string memory communityName, string memory jobSector, string memory emotionalTag) external onlyAdmin {
        entries.push(HiringEntry(communityName, jobSector, emotionalTag, true, false));
    }

    function activateHiring(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function getHiringEntry(uint256 index) external view returns (HiringEntry memory) {
        return entries[index];
    }
}
