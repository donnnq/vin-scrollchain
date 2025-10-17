// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FlavorSovereigntyFellowship {
    address public admin;

    struct FlavorEntry {
        string dishName;
        string region;
        string emotionalTag;
        bool initiated;
        bool protected;
    }

    FlavorEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateFlavor(string memory dishName, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(FlavorEntry(dishName, region, emotionalTag, true, false));
    }

    function protectFlavor(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getFlavor(uint256 index) external view returns (FlavorEntry memory) {
        return entries[index];
    }
}
