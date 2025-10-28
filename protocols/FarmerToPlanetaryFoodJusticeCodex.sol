// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FarmerToPlanetaryFoodJusticeCodex {
    address public steward;

    struct JusticeEntry {
        string sector; // "Rice farmers"
        string clause; // "Scrollchain-sealed codex for food justice and planetary nourishment consequence"
        string emotionalTag;
        bool archived;
        bool codified;
    }

    JusticeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function codifyFarmerJustice(string memory sector, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(JusticeEntry(sector, clause, emotionalTag, true, true));
    }

    function getJusticeEntry(uint256 index) external view returns (JusticeEntry memory) {
        return entries[index];
    }
}
