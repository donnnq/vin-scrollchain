// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodSovereigntyDAO {
    address public admin;

    struct SovereigntyEntry {
        string cropOrDish;
        string region;
        string emotionalTag;
        bool summoned;
        bool protected;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSovereignty(string memory cropOrDish, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(cropOrDish, region, emotionalTag, true, false));
    }

    function protectSovereignty(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getSovereignty(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
