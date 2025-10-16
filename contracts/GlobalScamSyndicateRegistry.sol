// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalScamSyndicateRegistry {
    address public admin;

    struct ScamEntry {
        string operationName;
        string country;
        string scamType; // e.g., "telecom fraud", "online gambling"
        string emotionalTag;
        bool verified;
        bool archived;
    }

    ScamEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerScam(string memory operationName, string memory country, string memory scamType, string memory emotionalTag) external onlyAdmin {
        entries.push(ScamEntry(operationName, country, scamType, emotionalTag, true, false));
    }

    function archiveScam(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getScam(uint256 index) external view returns (ScamEntry memory) {
        return entries[index];
    }
}
