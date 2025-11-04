// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIEthicsMasteryLedger {
    address public steward;

    struct MasteryEntry {
        string barangay;
        string ethicsDomain;
        string masteryScore;
        string emotionalTag;
    }

    MasteryEntry[] public ledger;

    event AIEthicsMasteryTagged(string barangay, string ethicsDomain, string masteryScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagMastery(
        string memory barangay,
        string memory ethicsDomain,
        string memory masteryScore,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(MasteryEntry(barangay, ethicsDomain, masteryScore, emotionalTag));
        emit AIEthicsMasteryTagged(barangay, ethicsDomain, masteryScore, emotionalTag);
    }
}
