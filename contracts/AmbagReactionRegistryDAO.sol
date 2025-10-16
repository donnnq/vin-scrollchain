// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AmbagReactionRegistryDAO {
    address public admin;

    struct ReactionEntry {
        string username;
        string commentExcerpt;
        string emotionalTag;
        bool archived;
        bool featured;
    }

    ReactionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitReaction(string memory username, string memory commentExcerpt, string memory emotionalTag) external onlyAdmin {
        entries.push(ReactionEntry(username, commentExcerpt, emotionalTag, false, false));
    }

    function archiveReaction(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function featureReaction(uint256 index) external onlyAdmin {
        entries[index].featured = true;
    }

    function getReaction(uint256 index) external view returns (ReactionEntry memory) {
        return entries[index];
    }
}
