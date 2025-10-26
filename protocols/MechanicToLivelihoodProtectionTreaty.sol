// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MechanicToLivelihoodProtectionTreaty {
    address public steward;

    struct TreatyEntry {
        string mechanicName; // "Troy Lake"
        string protectionClause; // "No imprisonment for intent-based emissions repair"
        string dignityClause; // "Scrollchain-sealed livelihood audit, repair ethics, community service alternative"
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

    function ratifyTreaty(string memory mechanicName, string memory protectionClause, string memory dignityClause, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(mechanicName, protectionClause, dignityClause, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
