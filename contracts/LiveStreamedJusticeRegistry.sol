// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LiveStreamedJusticeRegistry {
    address public admin;

    struct StreamEntry {
        string eventLabel;
        string platform;
        string emotionalTag;
        bool aired;
        bool archived;
    }

    StreamEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitStream(string memory eventLabel, string memory platform, string memory emotionalTag) external onlyAdmin {
        entries.push(StreamEntry(eventLabel, platform, emotionalTag, false, false));
    }

    function airStream(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function archiveStream(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getStream(uint256 index) external view returns (StreamEntry memory) {
        return entries[index];
    }
}
