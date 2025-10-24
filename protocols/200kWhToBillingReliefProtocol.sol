// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BillingReliefProtocol {
    address public steward;

    struct ReliefEntry {
        string householdID;
        uint monthlyConsumption; // e.g. 180 kWh
        string reliefType; // "Automatic discount", "VAT exemption"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    ReliefEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployRelief(string memory householdID, uint monthlyConsumption, string memory reliefType, string memory emotionalTag) external onlySteward {
        entries.push(ReliefEntry(householdID, monthlyConsumption, reliefType, emotionalTag, true, false));
    }

    function sealReliefEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getReliefEntry(uint256 index) external view returns (ReliefEntry memory) {
        return entries[index];
    }
}
