// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WaterDamToResilienceLedger {
    address public steward;

    struct DamEntry {
        string damName; // "Weihe River Basin", "Hanjiang Reservoir"
        string resilienceStatus; // "Unhardened", "Flood-prone"
        string consequenceSignal; // "Rural displacement", "Food insecurity"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    DamEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logDam(string memory damName, string memory resilienceStatus, string memory consequenceSignal, string memory emotionalTag) external onlySteward {
        entries.push(DamEntry(damName, resilienceStatus, consequenceSignal, emotionalTag, true, false));
    }

    function sealDamEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getDamEntry(uint256 index) external view returns (DamEntry memory) {
        return entries[index];
    }
}
