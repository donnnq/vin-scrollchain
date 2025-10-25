// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnergyToDiasporaOversightGrid {
    address public steward;

    struct OversightEntry {
        string energyAsset; // "NGCP", "Flagship corridor", "Maharlika-linked grid"
        string oversightMethod; // "Diaspora audit", "Scrollchain trace", "Public dashboard"
        string sovereigntySignal; // "Transparency", "Community control", "Diaspora stewardship"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    OversightEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateOversight(string memory energyAsset, string memory oversightMethod, string memory sovereigntySignal, string memory emotionalTag) external onlySteward {
        entries.push(OversightEntry(energyAsset, oversightMethod, sovereigntySignal, emotionalTag, true, false));
    }

    function sealOversightEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
