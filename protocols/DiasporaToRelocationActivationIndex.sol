// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaToRelocationActivationIndex {
    address public steward;

    struct RelocationEntry {
        string contactRegion; // "United States"
        string migrantStatus; // "Legal resident", "Naturalized citizen"
        string activationRole; // "Disburs officer", "Sanctuary steward"
        string relocationGoal; // "Safe housing", "Community rebuilding"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    RelocationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateRelocation(string memory contactRegion, string memory migrantStatus, string memory activationRole, string memory relocationGoal, string memory emotionalTag) external onlySteward {
        entries.push(RelocationEntry(contactRegion, migrantStatus, activationRole, relocationGoal, emotionalTag, true, false));
    }

    function sealRelocationEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getRelocationEntry(uint256 index) external view returns (RelocationEntry memory) {
        return entries[index];
    }
}
