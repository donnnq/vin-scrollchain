// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RemixSovereigntyFellowship {
    address public admin;

    struct RemixEntry {
        string creatorName;
        string remixDomain;
        string emotionalTag;
        bool summoned;
        bool protected;
    }

    RemixEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRemix(string memory creatorName, string memory remixDomain, string memory emotionalTag) external onlyAdmin {
        entries.push(RemixEntry(creatorName, remixDomain, emotionalTag, true, false));
    }

    function protectRemix(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getRemixEntry(uint256 index) external view returns (RemixEntry memory) {
        return entries[index];
    }
}
