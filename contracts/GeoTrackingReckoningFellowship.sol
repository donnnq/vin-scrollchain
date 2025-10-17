// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GeoTrackingReckoningFellowship {
    address public admin;

    struct ReckoningEntry {
        string region;
        string trackingConcern;
        string emotionalTag;
        bool summoned;
        bool aired;
    }

    ReckoningEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReckoning(string memory region, string memory trackingConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(ReckoningEntry(region, trackingConcern, emotionalTag, true, false));
    }

    function airReckoning(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function getReckoning(uint256 index) external view returns (ReckoningEntry memory) {
        return entries[index];
    }
}
