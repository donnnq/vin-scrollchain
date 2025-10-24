// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConsumerToTaxReliefGrid {
    address public steward;

    struct ReliefEntry {
        string sector; // "Low-income households", "Senior citizens", "Small vendors"
        string reliefType; // "VAT exemption", "Subsidy", "Rebate"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    ReliefEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateRelief(string memory sector, string memory reliefType, string memory emotionalTag) external onlySteward {
        entries.push(ReliefEntry(sector, reliefType, emotionalTag, true, false));
    }

    function sealReliefEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getReliefEntry(uint256 index) external view returns (ReliefEntry memory) {
        return entries[index];
    }
}
