// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MarcoletaBillToSubsidyActivationGrid {
    address public steward;

    struct SubsidyEntry {
        string billName; // "Senate Bill No. 63"
        string sponsor; // "Sen. Rodante Marcoleta"
        string subsidyScope; // "Below 200 kWh households"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    SubsidyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateSubsidy(string memory billName, string memory sponsor, string memory subsidyScope, string memory emotionalTag) external onlySteward {
        entries.push(SubsidyEntry(billName, sponsor, subsidyScope, emotionalTag, true, false));
    }

    function sealSubsidyEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getSubsidyEntry(uint256 index) external view returns (SubsidyEntry memory) {
        return entries[index];
    }
}
