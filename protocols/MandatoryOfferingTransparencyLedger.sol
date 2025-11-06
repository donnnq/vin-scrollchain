// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MandatoryOfferingTransparencyLedger {
    address public steward;

    struct OfferingEntry {
        string organization;
        string offeringType;
        string expectationLevel;
        string emotionalTag;
    }

    OfferingEntry[] public ledger;

    event OfferingTransparencyTagged(string organization, string offeringType, string expectationLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagOfferingTransparency(
        string memory organization,
        string memory offeringType,
        string memory expectationLevel,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(OfferingEntry(organization, offeringType, expectationLevel, emotionalTag));
        emit OfferingTransparencyTagged(organization, offeringType, expectationLevel, emotionalTag);
    }
}
