// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryProtestBroadcastPack {
    address public admin;

    struct BroadcastEntry {
        string protestTheme;
        string broadcastMessage;
        string emotionalTag;
        bool aired;
        bool archived;
    }

    BroadcastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory protestTheme, string memory broadcastMessage, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(protestTheme, broadcastMessage, emotionalTag, false, false));
    }

    function airBroadcast(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function archiveBroadcast(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
