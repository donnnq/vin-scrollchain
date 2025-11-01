// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokPoweredEsportsDAO {
    address public steward;

    struct EsportsEntry {
        string teamName;
        string purokZone;
        string gameTitle;
        string emotionalTag;
    }

    EsportsEntry[] public registry;

    event EsportsTeamRegistered(string teamName, string purokZone, string gameTitle, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function registerTeam(
        string memory teamName,
        string memory purokZone,
        string memory gameTitle,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EsportsEntry(teamName, purokZone, gameTitle, emotionalTag));
        emit EsportsTeamRegistered(teamName, purokZone, gameTitle, emotionalTag);
    }
}
