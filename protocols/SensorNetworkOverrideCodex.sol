// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SensorNetworkOverrideCodex {
    address public admin;

    struct SensorEntry {
        string systemName;
        string overrideClause;
        string fusionPartner;
        string emotionalTag;
        bool summoned;
        bool overridden;
        bool sealed;
    }

    SensorEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOverride(string memory systemName, string memory overrideClause, string memory fusionPartner, string memory emotionalTag) external onlyAdmin {
        entries.push(SensorEntry(systemName, overrideClause, fusionPartner, emotionalTag, true, false, false));
    }

    function confirmOverride(uint256 index) external onlyAdmin {
        entries[index].overridden = true;
    }

    function sealSensorEntry(uint256 index) external onlyAdmin {
        require(entries[index].overridden, "Must be overridden first");
        entries[index].sealed = true;
    }

    function getSensorEntry(uint256 index) external view returns (SensorEntry memory) {
        return entries[index];
    }
}
