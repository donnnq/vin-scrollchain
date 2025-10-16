// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MobileGamingRevivalCodex {
    address public admin;

    struct RevivalEntry {
        string gameTitle;
        string revivalMethod;
        string emotionalTag;
        bool deployed;
        bool archived;
    }

    RevivalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRevival(string memory gameTitle, string memory revivalMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(RevivalEntry(gameTitle, revivalMethod, emotionalTag, false, false));
    }

    function deployRevival(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function archiveRevival(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getRevival(uint256 index) external view returns (RevivalEntry memory) {
        return entries[index];
    }
}
