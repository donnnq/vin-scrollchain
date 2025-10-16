// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MobileSovereigntySDKPack {
    address public admin;

    struct SDKEntry {
        string toolName;
        string useCase;
        string emotionalTag;
        bool published;
        bool archived;
    }

    SDKEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function publishSDK(string memory toolName, string memory useCase, string memory emotionalTag) external onlyAdmin {
        entries.push(SDKEntry(toolName, useCase, emotionalTag, true, false));
    }

    function archiveSDK(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getSDK(uint256 index) external view returns (SDKEntry memory) {
        return entries[index];
    }
}
