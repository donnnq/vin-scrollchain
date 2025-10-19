// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommuterShedSolarUpgradeCodex {
    address public admin;

    struct ShedEntry {
        string location;
        string upgradeType;
        string emotionalTag;
        bool summoned;
        bool upgraded;
        bool sealed;
    }

    ShedEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonShedUpgrade(string memory location, string memory upgradeType, string memory emotionalTag) external onlyAdmin {
        entries.push(ShedEntry(location, upgradeType, emotionalTag, true, false, false));
    }

    function confirmUpgrade(uint256 index) external onlyAdmin {
        entries[index].upgraded = true;
    }

    function sealShedUpgrade(uint256 index) external onlyAdmin {
        require(entries[index].upgraded, "Must be upgraded first");
        entries[index].sealed = true;
    }

    function getShedEntry(uint256 index) external view returns (ShedEntry memory) {
        return entries[index];
    }
}
