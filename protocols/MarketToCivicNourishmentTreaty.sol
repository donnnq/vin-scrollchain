// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MarketToCivicNourishmentTreaty {
    address public steward;

    struct TreatyEntry {
        string market; // "Esplanade Night Market"
        string clause; // "Scrollchain-sealed treaty for vendor dignity, food equity, and planetary nourishment"
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

    function ratifyTreaty(string memory market, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(market, clause, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
