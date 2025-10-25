// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StrategicMineralFreezeLedger {
    address public steward;

    struct FreezeEntry {
        string mineralType; // "Rare Earth Magnet"
        string useCase; // "Military", "EV battery", "Telecom"
        string freezeSignal; // "Export blocked", "Import denied"
        string emotionalTag;
        bool frozen;
        bool sealed;
    }

    FreezeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function freezeMineral(string memory mineralType, string memory useCase, string memory freezeSignal, string memory emotionalTag) external onlySteward {
        entries.push(FreezeEntry(mineralType, useCase, freezeSignal, emotionalTag, true, false));
    }

    function sealFreezeEntry(uint256 index) external onlySteward {
        require(entries[index].frozen, "Must be frozen first");
        entries[index].sealed = true;
    }

    function getFreezeEntry(uint256 index) external view returns (FreezeEntry memory) {
        return entries[index];
    }
}
