// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayBiodiversitySignalDAO {
    address public steward;

    struct SignalEntry {
        string barangay;
        string biodiversityAsset;
        string signalStrength;
        string emotionalTag;
    }

    SignalEntry[] public registry;

    event BiodiversitySignalTagged(string barangay, string biodiversityAsset, string signalStrength, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSignal(
        string memory barangay,
        string memory biodiversityAsset,
        string memory signalStrength,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SignalEntry(barangay, biodiversityAsset, signalStrength, emotionalTag));
        emit BiodiversitySignalTagged(barangay, biodiversityAsset, signalStrength, emotionalTag);
    }
}
