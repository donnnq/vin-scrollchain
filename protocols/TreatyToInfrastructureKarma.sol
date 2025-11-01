// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToInfrastructureKarma {
    address public steward;

    struct KarmaEntry {
        string nation;
        string corridor;
        string karmaLevel;
        string dignityTag;
    }

    KarmaEntry[] public treatyLog;

    event InfrastructureKarmaTagged(string nation, string corridor, string karmaLevel, string dignityTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagKarma(
        string memory nation,
        string memory corridor,
        string memory karmaLevel,
        string memory dignityTag
    ) public onlySteward {
        treatyLog.push(KarmaEntry(nation, corridor, karmaLevel, dignityTag));
        emit InfrastructureKarmaTagged(nation, corridor, karmaLevel, dignityTag);
    }
}
