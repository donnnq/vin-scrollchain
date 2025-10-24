// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnergySubsidyToPurokActivationProtocol {
    address public steward;

    struct ActivationEntry {
        string purokZone; // "Northville 8"
        string subsidyType; // "Below 200 kWh discount"
        string activationStatus; // "Active", "Pending", "Under review"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    ActivationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deploySubsidy(string memory purokZone, string memory subsidyType, string memory activationStatus, string memory emotionalTag) external onlySteward {
        entries.push(ActivationEntry(purokZone, subsidyType, activationStatus, emotionalTag, true, false));
    }

    function sealActivationEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getActivationEntry(uint256 index) external view returns (ActivationEntry memory) {
        return entries[index];
    }
}
