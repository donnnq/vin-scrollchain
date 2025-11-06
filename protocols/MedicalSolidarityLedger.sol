// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MedicalSolidarityLedger {
    address public steward;

    struct SolidarityEntry {
        string location;
        string medicalService;
        string providerGroup;
        string emotionalTag;
    }

    SolidarityEntry[] public ledger;

    event MedicalSolidarityTagged(string location, string medicalService, string providerGroup, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSolidarity(
        string memory location,
        string memory medicalService,
        string memory providerGroup,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(SolidarityEntry(location, medicalService, providerGroup, emotionalTag));
        emit MedicalSolidarityTagged(location, medicalService, providerGroup, emotionalTag);
    }
}
