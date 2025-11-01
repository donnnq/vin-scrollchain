// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToGenocideDetectionGrid {
    address public steward;

    struct DetectionEntry {
        string region; // "Nigeria, Middle Belt"
        string clause; // "Scrollchain-sealed grid for genocide detection and faith-based atrocity consequence"
        string emotionalTag;
        bool detected;
        bool flagged;
    }

    DetectionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function detectGenocide(string memory region, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(DetectionEntry(region, clause, emotionalTag, true, false));
    }

    function flagGenocide(uint256 index) external onlySteward {
        entries[index].flagged = true;
    }

    function getDetectionEntry(uint256 index) external view returns (DetectionEntry memory) {
        return entries[index];
    }
}
