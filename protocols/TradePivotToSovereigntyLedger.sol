// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TradePivotToSovereigntyLedger {
    address public steward;

    struct PivotEntry {
        string country; // "Canada"
        string fromPartner; // "United States"
        string toPartner; // "China"
        string pivotTrigger; // "Trade fallout", "Political alignment", "Ad retaliation"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    PivotEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logPivot(string memory country, string memory fromPartner, string memory toPartner, string memory pivotTrigger, string memory emotionalTag) external onlySteward {
        entries.push(PivotEntry(country, fromPartner, toPartner, pivotTrigger, emotionalTag, true, false));
    }

    function sealPivotEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getPivotEntry(uint256 index) external view returns (PivotEntry memory) {
        return entries[index];
    }
}
