// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeveloperSovereigntyFellowship {
    address public admin;

    struct FellowshipEntry {
        string devName;
        string purokLabel;
        string emotionalTag;
        bool initiated;
        bool completed;
    }

    FellowshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateFellowship(string memory devName, string memory purokLabel, string memory emotionalTag) external onlyAdmin {
        entries.push(FellowshipEntry(devName, purokLabel, emotionalTag, true, false));
    }

    function completeFellowship(uint256 index) external onlyAdmin {
        entries[index].completed = true;
    }

    function getFellowship(uint256 index) external view returns (FellowshipEntry memory) {
        return entries[index];
    }
}
