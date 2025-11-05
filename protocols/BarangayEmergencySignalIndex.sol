// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayEmergencySignalIndex {
    address public steward;

    struct SignalEntry {
        string barangay;
        string emergencyType;
        string responseProtocol;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event EmergencySignalTagged(string barangay, string emergencyType, string responseProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSignal(
        string memory barangay,
        string memory emergencyType,
        string memory responseProtocol,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(barangay, emergencyType, responseProtocol, emotionalTag));
        emit EmergencySignalTagged(barangay, emergencyType, responseProtocol, emotionalTag);
    }
}
