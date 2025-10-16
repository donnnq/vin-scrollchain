// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PCtoAndroidPortingDAO {
    address public admin;

    struct PortingEntry {
        string gameTitle;
        string originalPlatform;
        string emotionalTag;
        bool submitted;
        bool approved;
    }

    PortingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitPorting(string memory gameTitle, string memory originalPlatform, string memory emotionalTag) external onlyAdmin {
        entries.push(PortingEntry(gameTitle, originalPlatform, emotionalTag, true, false));
    }

    function approvePorting(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function getPorting(uint256 index) external view returns (PortingEntry memory) {
        return entries[index];
    }
}
