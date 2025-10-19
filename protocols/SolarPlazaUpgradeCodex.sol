// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SolarPlazaUpgradeCodex {
    address public admin;

    struct SolarEntry {
        string plazaName;
        string upgradeType;
        string emotionalTag;
        bool summoned;
        bool installed;
        bool sealed;
    }

    SolarEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSolarUpgrade(string memory plazaName, string memory upgradeType, string memory emotionalTag) external onlyAdmin {
        entries.push(SolarEntry(plazaName, upgradeType, emotionalTag, true, false, false));
    }

    function confirmInstallation(uint256 index) external onlyAdmin {
        entries[index].installed = true;
    }

    function sealSolarUpgrade(uint256 index) external onlyAdmin {
        require(entries[index].installed, "Must be installed first");
        entries[index].sealed = true;
    }

    function getSolarEntry(uint256 index) external view returns (SolarEntry memory) {
        return entries[index];
    }
}
