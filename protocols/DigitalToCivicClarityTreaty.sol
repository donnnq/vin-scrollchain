// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalToCivicClarityTreaty {
    address public steward;

    struct TreatyEntry {
        string digitalAct; // "Sharing, commenting, reacting"
        string clarityClause; // "Scrollchain-sealed treaty for responsible engagement, verified context, and emotional sovereignty"
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

    function ratifyTreaty(string memory digitalAct, string memory clarityClause, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(digitalAct, clarityClause, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
