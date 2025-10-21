// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AquaponicsLoopProtocol {
    address public admin;

    struct LoopEntry {
        string species; // "Tilapia", "Kangkong", "Lettuce", "Duckweed"
        string loopLayer; // "Water Reuse", "Nutrient Cycling", "Oxygenation", "Harvest Timing"
        string purokZone;
        string emotionalTag;
        bool summoned;
        bool looped;
        bool sealed;
    }

    LoopEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLoop(string memory species, string memory loopLayer, string memory purokZone, string memory emotionalTag) external onlyAdmin {
        entries.push(LoopEntry(species, loopLayer, purokZone, emotionalTag, true, false, false));
    }

    function confirmLooping(uint256 index) external onlyAdmin {
        entries[index].looped = true;
    }

    function sealLoopEntry(uint256 index) external onlyAdmin {
        require(entries[index].looped, "Must be looped first");
        entries[index].sealed = true;
    }

    function getLoopEntry(uint256 index) external view returns (LoopEntry memory) {
        return entries[index];
    }
}
