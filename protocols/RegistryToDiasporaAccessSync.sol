// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RegistryToDiasporaAccessSync {
    address public steward;

    struct SyncEntry {
        string medicineName; // "QuantumPainX"
        string diasporaRegion; // "North America"
        string syncMethod; // "Registry-linked access with cultural credit"
        string emotionalTag;
        bool synced;
        bool sealed;
    }

    SyncEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function syncAccess(string memory medicineName, string memory diasporaRegion, string memory syncMethod, string memory emotionalTag) external onlySteward {
        entries.push(SyncEntry(medicineName, diasporaRegion, syncMethod, emotionalTag, true, false));
    }

    function sealSyncEntry(uint256 index) external onlySteward {
        require(entries[index].synced, "Must be synced first");
        entries[index].sealed = true;
    }

    function getSyncEntry(uint256 index) external view returns (SyncEntry memory) {
        return entries[index];
    }
}
