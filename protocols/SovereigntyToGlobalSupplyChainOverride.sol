// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SovereigntyToGlobalSupplyChainOverride {
    address public steward;

    struct OverrideEntry {
        string mineralType; // "Rare Earth Magnet"
        string overrideSignal; // "Domestic processing only", "Export freeze", "Strategic reserve activation"
        string affectedCorridor; // "Defense", "EV", "Telecom"
        string emotionalTag;
        bool overridden;
        bool sealed;
    }

    OverrideEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function overrideSupplyChain(string memory mineralType, string memory overrideSignal, string memory affectedCorridor, string memory emotionalTag) external onlySteward {
        entries.push(OverrideEntry(mineralType, overrideSignal, affectedCorridor, emotionalTag, true, false));
    }

    function sealOverrideEntry(uint256 index) external onlySteward {
        require(entries[index].overridden, "Must be overridden first");
        entries[index].sealed = true;
    }

    function getOverrideEntry(uint256 index) external view returns (OverrideEntry memory) {
        return entries[index];
    }
}
