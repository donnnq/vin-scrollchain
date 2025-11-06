// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureCompletionKarmaLedger {
    address public steward;

    struct KarmaEntry {
        string projectName;
        string completionStatus;
        string karmaSignal;
        string emotionalTag;
    }

    KarmaEntry[] public ledger;

    event InfrastructureKarmaTagged(string projectName, string completionStatus, string karmaSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagKarma(
        string memory projectName,
        string memory completionStatus,
        string memory karmaSignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(KarmaEntry(projectName, completionStatus, karmaSignal, emotionalTag));
        emit InfrastructureKarmaTagged(projectName, completionStatus, karmaSignal, emotionalTag);
    }
}
