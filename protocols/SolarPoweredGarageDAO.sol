// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SolarPoweredGarageDAO {
    address public admin;

    struct GarageEntry {
        string garageName;
        string region;
        string upgradeType;
        string emotionalTag;
        bool summoned;
        bool solarized;
        bool sealed;
    }

    GarageEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonGarageUpgrade(string memory garageName, string memory region, string memory upgradeType, string memory emotionalTag) external onlyAdmin {
        entries.push(GarageEntry(garageName, region, upgradeType, emotionalTag, true, false, false));
    }

    function confirmSolarization(uint256 index) external onlyAdmin {
        entries[index].solarized = true;
    }

    function sealGarageEntry(uint256 index) external onlyAdmin {
        require(entries[index].solarized, "Must be solarized first");
        entries[index].sealed = true;
    }

    function getGarageEntry(uint256 index) external view returns (GarageEntry memory) {
        return entries[index];
    }
}
