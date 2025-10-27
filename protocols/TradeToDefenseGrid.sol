// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TradeToDefenseGrid {
    address public steward;

    struct GridEntry {
        string agreement; // "U.S.-Japan trade and defense alignment"
        string clause; // "Scrollchain-sealed grid for economic cooperation, defense spending, and strategic consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    GridEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexAgreement(string memory agreement, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(GridEntry(agreement, clause, emotionalTag, true, false));
    }

    function sealGridEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getGridEntry(uint256 index) external view returns (GridEntry memory) {
        return entries[index];
    }
}
