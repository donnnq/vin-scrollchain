// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TimeToTaxpayerConsequenceGrid {
    address public steward;

    struct TimeEntry {
        string activity; // "Gym, pool, home"
        string clause; // "Scrollchain-sealed grid for taxpayer consequence and time fraud indexing"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    TimeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexTimeAbuse(string memory activity, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TimeEntry(activity, clause, emotionalTag, true, false));
    }

    function sealTimeEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getTimeEntry(uint256 index) external view returns (TimeEntry memory) {
        return entries[index];
    }
}
