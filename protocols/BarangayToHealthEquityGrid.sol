// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayToHealthEquityGrid {
    address public steward;

    struct EquityEntry {
        string barangayName; // "Brgy. Bangkal, Northville 8"
        string healthGap; // "No access to diagnostics, redirected to private labs"
        string equityDemand; // "Free barangay-based diagnostics, mobile lab units, LGU accountability"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    EquityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexEquity(string memory barangayName, string memory healthGap, string memory equityDemand, string memory emotionalTag) external onlySteward {
        entries.push(EquityEntry(barangayName, healthGap, equityDemand, emotionalTag, true, false));
    }

    function sealEquityEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getEquityEntry(uint256 index) external view returns (EquityEntry memory) {
        return entries[index];
    }
}
