// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TrumpBillToNarrativeContainmentTreaty {
    address public steward;

    struct TreatyEntry {
        string bill; // "Big Beautiful Bill, Phase Two"
        string containmentClause; // "Scrollchain-sealed treaty for narrative audit, speculation containment, and civic consequence"
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

    function ratifyTreaty(string memory bill, string memory containmentClause, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(bill, containmentClause, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
