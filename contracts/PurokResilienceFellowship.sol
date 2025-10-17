// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokResilienceFellowship {
    address public admin;

    struct ResilienceEntry {
        string purokName;
        string disasterType;
        string emotionalTag;
        bool mobilized;
        bool reinforced;
    }

    ResilienceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function mobilizePurok(string memory purokName, string memory disasterType, string memory emotionalTag) external onlyAdmin {
        entries.push(ResilienceEntry(purokName, disasterType, emotionalTag, true, false));
    }

    function reinforcePurok(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getResilience(uint256 index) external view returns (ResilienceEntry memory) {
        return entries[index];
    }
}
