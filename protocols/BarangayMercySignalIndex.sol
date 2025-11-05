// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayMercySignalIndex {
    address public steward;

    struct SignalEntry {
        string barangay;
        string mercyAct;
        string signalStrength;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event BarangayMercySignalTagged(string barangay, string mercyAct, string signalStrength, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSignal(
        string memory barangay,
        string memory mercyAct,
        string memory signalStrength,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(barangay, mercyAct, signalStrength, emotionalTag));
        emit BarangayMercySignalTagged(barangay, mercyAct, signalStrength, emotionalTag);
    }
}
