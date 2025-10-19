// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokPoweredGamingDAO {
    address public admin;

    struct GamingEntry {
        string purokName;
        string consoleType;
        string accessMethod;
        string emotionalTag;
        bool summoned;
        bool deployed;
        bool sealed;
    }

    GamingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonGamingAccess(string memory purokName, string memory consoleType, string memory accessMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(GamingEntry(purokName, consoleType, accessMethod, emotionalTag, true, false, false));
    }

    function confirmDeployment(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function sealGamingEntry(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getGamingEntry(uint256 index) external view returns (GamingEntry memory) {
        return entries[index];
    }
}
