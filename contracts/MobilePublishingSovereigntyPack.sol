// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MobilePublishingSovereigntyPack {
    address public admin;

    struct PublishingEntry {
        string gameTitle;
        string studioName;
        string emotionalTag;
        bool published;
        bool archived;
    }

    PublishingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitPublishing(string memory gameTitle, string memory studioName, string memory emotionalTag) external onlyAdmin {
        entries.push(PublishingEntry(gameTitle, studioName, emotionalTag, false, false));
    }

    function markPublished(uint256 index) external onlyAdmin {
        entries[index].published = true;
    }

    function archivePublishing(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getPublishing(uint256 index) external view returns (PublishingEntry memory) {
        return entries[index];
    }
}
