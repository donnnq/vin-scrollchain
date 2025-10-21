// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicLivestreamArchive {
    address public admin;

    struct StreamEntry {
        string host;
        string platform;
        string topic; // "Corruption", "Truth-Telling", "Public Accountability"
        string emotionalTag;
        bool summoned;
        bool archived;
        bool sealed;
    }

    StreamEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonStream(string memory host, string memory platform, string memory topic, string memory emotionalTag) external onlyAdmin {
        entries.push(StreamEntry(host, platform, topic, emotionalTag, true, false, false));
    }

    function confirmArchiving(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function sealStreamEntry(uint256 index) external onlyAdmin {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getStreamEntry(uint256 index) external view returns (StreamEntry memory) {
        return entries[index];
    }
}
