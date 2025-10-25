// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MineralToCybersecurityLedger {
    address public steward;

    struct CyberEntry {
        string mineralType; // "Rare Earth Magnet", "Gallium", "Germanium"
        string digitalUseCase; // "Satellite encryption", "Quantum firewall", "AI chip integrity"
        string threatSignal; // "Supply breach", "Backdoor risk", "Processor compromise"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    CyberEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logCyberMineral(string memory mineralType, string memory digitalUseCase, string memory threatSignal, string memory emotionalTag) external onlySteward {
        entries.push(CyberEntry(mineralType, digitalUseCase, threatSignal, emotionalTag, true, false));
    }

    function sealCyberEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getCyberEntry(uint256 index) external view returns (CyberEntry memory) {
        return entries[index];
    }
}
