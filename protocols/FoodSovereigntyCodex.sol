// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodSovereigntyCodex {
    address public admin;

    struct SovereigntyEntry {
        string crop;
        string region;
        string emotionalTag;
        bool summoned;
        bool ratified;
        bool sealed;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSovereignty(string memory crop, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(crop, region, emotionalTag, true, false, false));
    }

    function ratifySovereignty(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function sealSovereignty(uint256 index) external onlyAdmin {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
