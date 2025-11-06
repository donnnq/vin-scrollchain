// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NetworkSpamResistanceTreaty {
    address public steward;

    struct SpamEntry {
        string spamVector;
        string resistanceProtocol;
        string civicImpact;
        string emotionalTag;
    }

    SpamEntry[] public treaty;

    event SpamResistanceTagged(string spamVector, string resistanceProtocol, string civicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSpamResistance(
        string memory spamVector,
        string memory resistanceProtocol,
        string memory civicImpact,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(SpamEntry(spamVector, resistanceProtocol, civicImpact, emotionalTag));
        emit SpamResistanceTagged(spamVector, resistanceProtocol, civicImpact, emotionalTag);
    }
}
