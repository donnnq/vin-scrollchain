// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PovertyZoneCashTransferProtocol {
    address public steward;

    struct TransferEntry {
        string timestamp;
        string zoneID;
        string householdID;
        string transferAmount;
        string inflationAdjustment;
        string emotionalTag;
    }

    TransferEntry[] public protocol;

    event CashTransferDeployed(string timestamp, string zoneID, string householdID, string transferAmount, string inflationAdjustment, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function deployTransfer(
        string memory timestamp,
        string memory zoneID,
        string memory householdID,
        string memory transferAmount,
        string memory inflationAdjustment,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(TransferEntry(timestamp, zoneID, householdID, transferAmount, inflationAdjustment, emotionalTag));
        emit CashTransferDeployed(timestamp, zoneID, householdID, transferAmount, inflationAdjustment, emotionalTag);
    }
}
