// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeepSeaKarmaCodex {
    address public steward;

    struct KarmaEntry {
        string entityID;
        string violationType;
        string reefZone;
        string karmicResponse;
    }

    KarmaEntry[] public karmaLog;

    event KarmaTagged(string entityID, string violationType, string reefZone, string karmicResponse);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagKarma(
        string memory entityID,
        string memory violationType,
        string memory reefZone,
        string memory karmicResponse
    ) public onlySteward {
        karmaLog.push(KarmaEntry(entityID, violationType, reefZone, karmicResponse));
        emit KarmaTagged(entityID, violationType, reefZone, karmicResponse);
    }
}
