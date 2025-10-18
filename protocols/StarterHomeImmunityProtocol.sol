// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StarterHomeImmunityProtocol {
    address public admin;

    struct HomeEntry {
        string location;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    HomeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonHome(string memory location, string memory emotionalTag) external onlyAdmin {
        entries.push(HomeEntry(location, emotionalTag, true, false, false));
    }

    function protectHome(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealImmunity(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getHomeEntry(uint256 index) external view returns (HomeEntry memory) {
        return entries[index];
    }
}
