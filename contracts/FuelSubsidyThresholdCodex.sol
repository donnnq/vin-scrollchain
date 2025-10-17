// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FuelSubsidyThresholdCodex {
    address public admin;

    struct ThresholdEntry {
        uint256 globalCrudePrice;
        uint256 localPumpPrice;
        uint256 fxRate;
        string emotionalTag;
        bool activated;
        bool reviewed;
    }

    ThresholdEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitThreshold(uint256 globalCrudePrice, uint256 localPumpPrice, uint256 fxRate, string memory emotionalTag) external onlyAdmin {
        entries.push(ThresholdEntry(globalCrudePrice, localPumpPrice, fxRate, emotionalTag, false, false));
    }

    function activateThreshold(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function reviewThreshold(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function getThresholdEntry(uint256 index) external view returns (ThresholdEntry memory) {
        return entries[index];
    }
}
