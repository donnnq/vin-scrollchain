// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DroneSwarmMasteryCodex {
    address public admin;

    struct SwarmEntry {
        string operationName;
        string tacticalDomain;
        string emotionalTag;
        bool deployed;
        bool archived;
    }

    SwarmEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deploySwarm(string memory operationName, string memory tacticalDomain, string memory emotionalTag) external onlyAdmin {
        entries.push(SwarmEntry(operationName, tacticalDomain, emotionalTag, true, false));
    }

    function archiveSwarm(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getSwarmEntry(uint256 index) external view returns (SwarmEntry memory) {
        return entries[index];
    }
}
