// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfEthicalMemoryDAO {
    address public admin;

    struct MemoryEntry {
        string eventLabel;
        string ethicsClause;
        string emotionalTag;
        bool archived;
    }

    MemoryEntry[] public memories;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _eventLabel, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        memories.push(MemoryEntry(_eventLabel, _ethicsClause, _emotionalTag, false));
    }

    function archiveEntry(uint256 index) external onlyAdmin {
        memories[index].archived = true;
    }

    function getEntry(uint256 index) external view returns (MemoryEntry memory) {
        return memories[index];
    }
}
