// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokCropResilienceProtocol {
    address public admin;

    struct ResilienceEntry {
        string purokName;
        string cropType;
        string upgradeType;
        string emotionalTag;
        bool summoned;
        bool upgraded;
        bool sealed;
    }

    ResilienceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonResilienceUpgrade(string memory purokName, string memory cropType, string memory upgradeType, string memory emotionalTag) external onlyAdmin {
        entries.push(ResilienceEntry(purokName, cropType, upgradeType, emotionalTag, true, false, false));
    }

    function confirmUpgrade(uint256 index) external onlyAdmin {
        entries[index].upgraded = true;
    }

    function sealResilienceUpgrade(uint256 index) external onlyAdmin {
        require(entries[index].upgraded, "Must be upgraded first");
        entries[index].sealed = true;
    }

    function getResilienceEntry(uint256 index) external view returns (ResilienceEntry memory) {
        return entries[index];
    }
}
