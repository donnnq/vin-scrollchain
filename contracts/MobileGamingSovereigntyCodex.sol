// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MobileGamingSovereigntyCodex {
    address public admin;

    struct SovereigntyEntry {
        string gameTitle;
        string platform;
        string emotionalTag;
        bool deployed;
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

    function submitSovereignty(string memory gameTitle, string memory platform, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(gameTitle, platform, emotionalTag, false, false));
    }

    function deploySovereignty(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function archiveSovereignty(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getSovereignty(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
