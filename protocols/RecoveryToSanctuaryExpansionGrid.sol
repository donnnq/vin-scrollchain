// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RecoveryToSanctuaryExpansionGrid {
    address public steward;

    struct ExpansionEntry {
        string traumaType; // "Displacement", "Neglect", "Abuse"
        string recoveryMethod; // "Group therapy", "Art healing", "Community wellness"
        string sanctuaryZone; // "Ghost city", "Diaspora hub"
        string emotionalTag;
        bool expanded;
        bool sealed;
    }

    ExpansionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function expandSanctuary(string memory traumaType, string memory recoveryMethod, string memory sanctuaryZone, string memory emotionalTag) external onlySteward {
        entries.push(ExpansionEntry(traumaType, recoveryMethod, sanctuaryZone, emotionalTag, true, false));
    }

    function sealExpansionEntry(uint256 index) external onlySteward {
        require(entries[index].expanded, "Must be expanded first");
        entries[index].sealed = true;
    }

    function getExpansionEntry(uint256 index) external view returns (ExpansionEntry memory) {
        return entries[index];
    }
}
