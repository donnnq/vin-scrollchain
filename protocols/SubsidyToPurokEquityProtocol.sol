// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SubsidyToPurokEquityProtocol {
    address public steward;

    struct SubsidyEntry {
        string purokZone; // "Northville 8", "Barangay Bangkal"
        string subsidyType; // "Food", "Electricity", "Education"
        string equitySignal; // "Access", "Affordability", "Community uplift"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    SubsidyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deploySubsidy(string memory purokZone, string memory subsidyType, string memory equitySignal, string memory emotionalTag) external onlySteward {
        entries.push(SubsidyEntry(purokZone, subsidyType, equitySignal, emotionalTag, true, false));
    }

    function sealSubsidyEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getSubsidyEntry(uint256 index) external view returns (SubsidyEntry memory) {
        return entries[index];
    }
}
