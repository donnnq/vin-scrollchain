// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MobileDevSovereigntyCodex {
    address public admin;

    struct SovereigntyEntry {
        string devName;
        string purokLabel;
        string emotionalTag;
        bool codified;
        bool archived;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function codifySovereignty(string memory devName, string memory purokLabel, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(devName, purokLabel, emotionalTag, true, false));
    }

    function archiveSovereignty(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getSovereignty(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
