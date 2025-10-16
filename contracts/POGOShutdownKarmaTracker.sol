// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract POGOShutdownKarmaTracker {
    address public admin;

    struct ShutdownEntry {
        string operationName;
        string city;
        string violationType;
        string emotionalTag;
        bool shutdown;
        bool prosecuted;
    }

    ShutdownEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logShutdown(string memory operationName, string memory city, string memory violationType, string memory emotionalTag) external onlyAdmin {
        entries.push(ShutdownEntry(operationName, city, violationType, emotionalTag, true, false));
    }

    function markProsecuted(uint256 index) external onlyAdmin {
        entries[index].prosecuted = true;
    }

    function getShutdown(uint256 index) external view returns (ShutdownEntry memory) {
        return entries[index];
    }
}
