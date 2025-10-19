// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicTransitComfortDAO {
    address public admin;

    struct ComfortEntry {
        string location;
        string upgradeType;
        string emotionalTag;
        bool summoned;
        bool upgraded;
        bool sealed;
    }

    ComfortEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonComfortUpgrade(string memory location, string memory upgradeType, string memory emotionalTag) external onlyAdmin {
        entries.push(ComfortEntry(location, upgradeType, emotionalTag, true, false, false));
    }

    function confirmUpgrade(uint256 index) external onlyAdmin {
        entries[index].upgraded = true;
    }

    function sealComfortUpgrade(uint256 index) external onlyAdmin {
        require(entries[index].upgraded, "Must be upgraded first");
        entries[index].sealed = true;
    }

    function getComfortEntry(uint256 index) external view returns (ComfortEntry memory) {
        return entries[index];
    }
}
