// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NpcToCybersecurityConsequenceTreaty {
    address public steward;

    struct TreatyEntry {
        string regulator; // "National Privacy Commission (NPC)"
        string action; // "Investigation launched, user protection protocols activated"
        string emotionalTag;
        bool ratified;
        bool sealed;
    }

    TreatyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyTreaty(string memory regulator, string memory action, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(regulator, action, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
