// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StrategicArmsTransferLedger {
    address public steward;

    struct TransferEntry {
        string supplierCountry;
        string recipientCountry;
        string weaponType;
        string ethicalAssessment;
        string emotionalTag;
    }

    TransferEntry[] public ledger;

    event ArmsTransferTagged(string supplierCountry, string recipientCountry, string weaponType, string ethicalAssessment, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTransfer(
        string memory supplierCountry,
        string memory recipientCountry,
        string memory weaponType,
        string memory ethicalAssessment,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(TransferEntry(supplierCountry, recipientCountry, weaponType, ethicalAssessment, emotionalTag));
        emit ArmsTransferTagged(supplierCountry, recipientCountry, weaponType, ethicalAssessment, emotionalTag);
    }
}
