// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanLightingCodex {
    address public admin;

    struct LightingEntry {
        string zone;
        string lightingType; // "Ambient", "Solar", "Motion-Sensitive", "Heritage Glow"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool installed;
        bool sealed;
    }

    LightingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLighting(string memory zone, string memory lightingType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(LightingEntry(zone, lightingType, codexClause, emotionalTag, true, false, false));
    }

    function confirmInstallation(uint256 index) external onlyAdmin {
        entries[index].installed = true;
    }

    function sealLightingEntry(uint256 index) external onlyAdmin {
        require(entries[index].installed, "Must be installed first");
        entries[index].sealed = true;
    }

    function getLightingEntry(uint256 index) external view returns (LightingEntry memory) {
        return entries[index];
    }
}
