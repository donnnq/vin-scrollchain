// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrocerosLightRitualDAO {
    address public admin;

    struct LightEntry {
        string zone;
        string fixtureType;
        string ritualClause;
        string emotionalTag;
        bool summoned;
        bool installed;
        bool sealed;
    }

    LightEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLight(string memory zone, string memory fixtureType, string memory ritualClause, string memory emotionalTag) external onlyAdmin {
        entries.push(LightEntry(zone, fixtureType, ritualClause, emotionalTag, true, false, false));
    }

    function confirmInstallation(uint256 index) external onlyAdmin {
        entries[index].installed = true;
    }

    function sealLightEntry(uint256 index) external onlyAdmin {
        require(entries[index].installed, "Must be installed first");
        entries[index].sealed = true;
    }

    function getLightEntry(uint256 index) external view returns (LightEntry memory) {
        return entries[index];
    }
}
