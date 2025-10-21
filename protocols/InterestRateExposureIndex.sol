// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InterestRateExposureIndex {
    address public admin;

    struct ExposureEntry {
        string institution;
        string assetClass; // "Real Estate", "Consumer Loans", "Corporate Bonds"
        string exposureLevel; // "Low", "Moderate", "High"
        string emotionalTag;
        bool summoned;
        bool scored;
        bool sealed;
    }

    ExposureEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonExposure(string memory institution, string memory assetClass, string memory exposureLevel, string memory emotionalTag) external onlyAdmin {
        entries.push(ExposureEntry(institution, assetClass, exposureLevel, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealExposureEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getExposureEntry(uint256 index) external view returns (ExposureEntry memory) {
        return entries[index];
    }
}
