// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UtilityAidToPurokEquityGrid {
    address public steward;

    struct UtilityAidEntry {
        string purokZone; // "Northville 8"
        string utilityType; // "Electricity", "Water", "Internet"
        string aidType; // "Lifeline rate", "Fuel subsidy", "Connectivity voucher"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    UtilityAidEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateUtilityAid(string memory purokZone, string memory utilityType, string memory aidType, string memory emotionalTag) external onlySteward {
        entries.push(UtilityAidEntry(purokZone, utilityType, aidType, emotionalTag, true, false));
    }

    function sealUtilityAidEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getUtilityAidEntry(uint256 index) external view returns (UtilityAidEntry memory) {
        return entries[index];
    }
}
