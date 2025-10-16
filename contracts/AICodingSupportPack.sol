// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AICodingSupportPack {
    address public admin;

    struct SupportEntry {
        string coderLabel;
        string toolUsed;
        string emotionalTag;
        bool assisted;
        bool disclosed;
    }

    SupportEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitSupport(string memory coderLabel, string memory toolUsed, string memory emotionalTag) external onlyAdmin {
        entries.push(SupportEntry(coderLabel, toolUsed, emotionalTag, true, false));
    }

    function discloseSupport(uint256 index) external onlyAdmin {
        entries[index].disclosed = true;
    }

    function getSupport(uint256 index) external view returns (SupportEntry memory) {
        return entries[index];
    }
}
