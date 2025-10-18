// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StarterHomeSovereigntyCodex {
    address public admin;

    struct HomeEntry {
        string homeName;
        string region;
        string emotionalTag;
        bool summoned;
        bool validated;
        bool sovereign;
    }

    HomeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonHome(string memory homeName, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(HomeEntry(homeName, region, emotionalTag, true, false, false));
    }

    function validateHome(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function sealSovereignty(uint256 index) external onlyAdmin {
        require(entries[index].validated, "Must be validated first");
        entries[index].sovereign = true;
    }

    function getHomeEntry(uint256 index) external view returns (HomeEntry memory) {
        return entries[index];
    }
}
