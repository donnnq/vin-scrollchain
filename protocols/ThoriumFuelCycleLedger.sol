// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ThoriumFuelCycleLedger {
    address public steward;

    struct FuelEntry {
        string reactorName;
        string conversionType;
        string validationStatus;
        string emotionalTag;
    }

    FuelEntry[] public ledger;

    event ThoriumCycleTagged(string reactorName, string conversionType, string validationStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagFuelCycle(
        string memory reactorName,
        string memory conversionType,
        string memory validationStatus,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(FuelEntry(reactorName, conversionType, validationStatus, emotionalTag));
        emit ThoriumCycleTagged(reactorName, conversionType, validationStatus, emotionalTag);
    }
}
