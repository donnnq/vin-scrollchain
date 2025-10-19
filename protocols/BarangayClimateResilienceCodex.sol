// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayClimateResilienceCodex {
    address public admin;

    struct ClimateEntry {
        string barangayName;
        string resilienceType;
        string emotionalTag;
        bool summoned;
        bool upgraded;
        bool sealed;
    }

    ClimateEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonResilienceUpgrade(string memory barangayName, string memory resilienceType, string memory emotionalTag) external onlyAdmin {
        entries.push(ClimateEntry(barangayName, resilienceType, emotionalTag, true, false, false));
    }

    function confirmUpgrade(uint256 index) external onlyAdmin {
        entries[index].upgraded = true;
    }

    function sealResilienceUpgrade(uint256 index) external onlyAdmin {
        require(entries[index].upgraded, "Must be upgraded first");
        entries[index].sealed = true;
    }

    function getClimateEntry(uint256 index) external view returns (ClimateEntry memory) {
        return entries[index];
    }
}
