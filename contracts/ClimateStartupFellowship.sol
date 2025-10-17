// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateStartupFellowship {
    address public admin;

    struct FellowshipEntry {
        string startupName;
        string region;
        string climateFocus;
        string emotionalTag;
        bool enrolled;
        bool incubated;
    }

    FellowshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function enrollStartup(string memory startupName, string memory region, string memory climateFocus, string memory emotionalTag) external onlyAdmin {
        entries.push(FellowshipEntry(startupName, region, climateFocus, emotionalTag, true, false));
    }

    function markIncubated(uint256 index) external onlyAdmin {
        entries[index].incubated = true;
    }

    function getFellowship(uint256 index) external view returns (FellowshipEntry memory) {
        return entries[index];
    }
}
