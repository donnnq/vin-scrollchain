// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisinformationSignalIndex {
    address public steward;

    struct SignalEntry {
        string barangay;
        string timestamp;
        uint256 spreadVelocity;
        string emotionalImpact;
        string civicDamageLevel;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event DisinformationSignalLogged(string barangay, string timestamp, uint256 spreadVelocity, string emotionalImpact, string civicDamageLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logSignal(
        string memory barangay,
        string memory timestamp,
        uint256 spreadVelocity,
        string memory emotionalImpact,
        string memory civicDamageLevel,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(barangay, timestamp, spreadVelocity, emotionalImpact, civicDamageLevel, emotionalTag));
        emit DisinformationSignalLogged(barangay, timestamp, spreadVelocity, emotionalImpact, civicDamageLevel, emotionalTag);
    }
}
