// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegacyRevivalStudioCodex {
    address public admin;

    struct RevivalEntry {
        string studioName;
        string gameTitle;
        string emotionalTag;
        bool revived;
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

    function submitRevival(string memory studioName, string memory gameTitle, string memory emotionalTag) external onlyAdmin {
        entries.push(RevivalEntry(studioName, gameTitle, emotionalTag, false, false));
    }

    function markRevived(uint256 index) external onlyAdmin {
        entries[index].revived = true;
    }

    function archiveRevival(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getRevival(uint256 index) external view returns (RevivalEntry memory) {
        return entries[index];
    }
}
