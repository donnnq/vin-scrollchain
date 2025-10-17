// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GeoSentimentSurveillanceDAO {
    address public admin;

    struct SurveillanceEntry {
        string region;
        string sentimentSignal;
        string emotionalTag;
        bool scanned;
        bool flagged;
    }

    SurveillanceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function scanRegion(string memory region, string memory sentimentSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(SurveillanceEntry(region, sentimentSignal, emotionalTag, true, false));
    }

    function flagRegion(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function getSurveillanceEntry(uint256 index) external view returns (SurveillanceEntry memory) {
        return entries[index];
    }
}
