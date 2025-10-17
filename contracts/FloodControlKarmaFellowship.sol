// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlKarmaFellowship {
    address public admin;

    struct FellowshipEntry {
        string projectName;
        string region;
        string emotionalTag;
        bool summoned;
        bool resolved;
    }

    FellowshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFellowship(string memory projectName, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(FellowshipEntry(projectName, region, emotionalTag, true, false));
    }

    function resolveFellowship(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getFellowship(uint256 index) external view returns (FellowshipEntry memory) {
        return entries[index];
    }
}
