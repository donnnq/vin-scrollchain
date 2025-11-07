// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FaithEndorsementAccountabilityLedger {
    address public steward;

    struct EndorsementEntry {
        string religiousLeader;
        string timestamp;
        string endorsedCandidate;
        string electionOutcome;
        string civicImpact;
        string emotionalTag;
    }

    EndorsementEntry[] public ledger;

    event EndorsementLogged(string religiousLeader, string timestamp, string endorsedCandidate, string electionOutcome, string civicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logEndorsement(
        string memory religiousLeader,
        string memory timestamp,
        string memory endorsedCandidate,
        string memory electionOutcome,
        string memory civicImpact,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(EndorsementEntry(religiousLeader, timestamp, endorsedCandidate, electionOutcome, civicImpact, emotionalTag));
        emit EndorsementLogged(religiousLeader, timestamp, endorsedCandidate, electionOutcome, civicImpact, emotionalTag);
    }
}
