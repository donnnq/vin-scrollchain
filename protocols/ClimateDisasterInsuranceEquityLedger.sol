// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateDisasterInsuranceEquityLedger {
    address public steward;

    struct InsuranceEntry {
        string barangay;
        string timestamp;
        string coverageType;
        string equityStatus;
        string emotionalTag;
    }

    InsuranceEntry[] public ledger;

    event InsuranceEquityLogged(string barangay, string timestamp, string coverageType, string equityStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logInsuranceEquity(
        string memory barangay,
        string memory timestamp,
        string memory coverageType,
        string memory equityStatus,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(InsuranceEntry(barangay, timestamp, coverageType, equityStatus, emotionalTag));
        emit InsuranceEquityLogged(barangay, timestamp, coverageType, equityStatus, emotionalTag);
    }
}
