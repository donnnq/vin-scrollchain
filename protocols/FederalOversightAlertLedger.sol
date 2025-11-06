// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FederalOversightAlertLedger {
    address public steward;

    struct AlertEntry {
        string issuingAgency;
        string receivingAgency;
        string alertType;
        string emotionalTag;
    }

    AlertEntry[] public ledger;

    event OversightAlertTagged(string issuingAgency, string receivingAgency, string alertType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAlert(
        string memory issuingAgency,
        string memory receivingAgency,
        string memory alertType,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(AlertEntry(issuingAgency, receivingAgency, alertType, emotionalTag));
        emit OversightAlertTagged(issuingAgency, receivingAgency, alertType, emotionalTag);
    }
}
