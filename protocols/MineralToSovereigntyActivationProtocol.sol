// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MineralToSovereigntyActivationProtocol {
    address public steward;

    struct ActivationEntry {
        string mineralType; // "Rare Earth Magnet"
        string sovereigntySignal; // "Domestic processing", "Export ban", "Strategic reserve"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    ActivationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateSovereignty(string memory mineralType, string memory sovereigntySignal, string memory emotionalTag) external onlySteward {
        entries.push(ActivationEntry(mineralType, sovereigntySignal, emotionalTag, true, false));
    }

    function sealActivationEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getActivationEntry(uint256 index) external view returns (ActivationEntry memory) {
        return entries[index];
    }
}
