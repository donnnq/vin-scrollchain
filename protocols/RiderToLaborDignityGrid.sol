// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiderToLaborDignityGrid {
    address public steward;

    struct DignityEntry {
        string platform; // "Shopee, Lazada"
        string grievance; // "Unpaid commissions, unfair suspensions, exploitative quotas"
        string emotionalTag;
        bool summoned;
        bool sealed;
    }

    DignityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function summonGrievance(string memory platform, string memory grievance, string memory emotionalTag) external onlySteward {
        entries.push(DignityEntry(platform, grievance, emotionalTag, true, false));
    }

    function sealDignityEntry(uint256 index) external onlySteward {
        require(entries[index].summoned, "Must be summoned first");
        entries[index].sealed = true;
    }

    function getDignityEntry(uint256 index) external view returns (DignityEntry memory) {
        return entries[index];
    }
}
