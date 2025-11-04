// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TeacherTrainingKarmaLedger {
    address public steward;

    struct KarmaEntry {
        string region;
        string trainingGap;
        string karmaSignal;
        string emotionalTag;
    }

    KarmaEntry[] public ledger;

    event TeacherTrainingKarmaTagged(string region, string trainingGap, string karmaSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagKarma(
        string memory region,
        string memory trainingGap,
        string memory karmaSignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(KarmaEntry(region, trainingGap, karmaSignal, emotionalTag));
        emit TeacherTrainingKarmaTagged(region, trainingGap, karmaSignal, emotionalTag);
    }
}
