// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RegionalBankExposureCodex {
    address public admin;

    struct ExposureEntry {
        string bankLabel;
        string assetType;
        string emotionalTag;
        bool mapped;
    }

    ExposureEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory bankLabel, string memory assetType, string memory emotionalTag) external onlyAdmin {
        entries.push(ExposureEntry(bankLabel, assetType, emotionalTag, false));
    }

    function markMapped(uint256 index) external onlyAdmin {
        entries[index].mapped = true;
    }

    function getEntry(uint256 index) external view returns (ExposureEntry memory) {
        return entries[index];
    }
}
