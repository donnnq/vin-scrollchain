// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangaySignalImmunityIndex {
    address public steward;

    struct ImmunityEntry {
        string barangay;
        string signalType;
        string immunityScore;
        string emotionalTag;
    }

    ImmunityEntry[] public index;

    event SignalImmunityIndexed(string barangay, string signalType, string immunityScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexImmunity(
        string memory barangay,
        string memory signalType,
        string memory immunityScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ImmunityEntry(barangay, signalType, immunityScore, emotionalTag));
        emit SignalImmunityIndexed(barangay, signalType, immunityScore, emotionalTag);
    }
}
