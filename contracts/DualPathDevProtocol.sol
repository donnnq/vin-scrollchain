// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DualPathDevProtocol {
    address public admin;

    enum DevPath { AI_Guided, PureCoder }

    struct DevEntry {
        string coderLabel;
        DevPath chosenPath;
        string emotionalTag;
        bool registered;
        bool ritualized;
    }

    DevEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerDev(string memory coderLabel, DevPath chosenPath, string memory emotionalTag) external onlyAdmin {
        entries.push(DevEntry(coderLabel, chosenPath, emotionalTag, true, false));
    }

    function ritualizePath(uint256 index) external onlyAdmin {
        entries[index].ritualized = true;
    }

    function getDevEntry(uint256 index) external view returns (DevEntry memory) {
        return entries[index];
    }
}
