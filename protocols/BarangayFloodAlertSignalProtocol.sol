// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayFloodAlertSignalProtocol {
    address public steward;

    struct AlertEntry {
        string barangay;
        string timestamp;
        string alertLevel;
        string signalMethod;
        string emotionalTag;
    }

    AlertEntry[] public protocol;

    event FloodAlertSignaled(string barangay, string timestamp, string alertLevel, string signalMethod, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function signalAlert(
        string memory barangay,
        string memory timestamp,
        string memory alertLevel,
        string memory signalMethod,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(AlertEntry(barangay, timestamp, alertLevel, signalMethod, emotionalTag));
        emit FloodAlertSignaled(barangay, timestamp, alertLevel, signalMethod, emotionalTag);
    }
}
