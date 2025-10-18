// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryComfortBroadcastProtocol {
    address public admin;

    struct BroadcastEntry {
        string message;
        string region;
        string emotionalTag;
        bool summoned;
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

    function summonBroadcast(string memory message, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(message, region, emotionalTag, true, false, false));
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
