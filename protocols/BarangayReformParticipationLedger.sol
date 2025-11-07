// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayReformParticipationLedger {
    address public steward;

    struct ParticipationEntry {
        string timestamp;
        string barangay;
        string reformTopic;
        string participationMode;
        string emotionalTag;
    }

    ParticipationEntry[] public ledger;

    event ReformParticipationLogged(string timestamp, string barangay, string reformTopic, string participationMode, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logParticipation(
        string memory timestamp,
        string memory barangay,
        string memory reformTopic,
        string memory participationMode,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ParticipationEntry(timestamp, barangay, reformTopic, participationMode, emotionalTag));
        emit ReformParticipationLogged(timestamp, barangay, reformTopic, participationMode, emotionalTag);
    }
}
