// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostAssetImmunityCodex {
    address public admin;

    struct GhostEntry {
        string assetType;
        string concealmentMethod;
        string linkedOfficial;
        string emotionalTag;
        bool summoned;
        bool exposed;
        bool sealed;
    }

    GhostEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonGhostAsset(string memory assetType, string memory concealmentMethod, string memory linkedOfficial, string memory emotionalTag) external onlyAdmin {
        entries.push(GhostEntry(assetType, concealmentMethod, linkedOfficial, emotionalTag, true, false, false));
    }

    function exposeGhostAsset(uint256 index) external onlyAdmin {
        entries[index].exposed = true;
    }

    function sealGhostAsset(uint256 index) external onlyAdmin {
        require(entries[index].exposed, "Must be exposed first");
        entries[index].sealed = true;
    }

    function getGhostEntry(uint256 index) external view returns (GhostEntry memory) {
        return entries[index];
    }
}
