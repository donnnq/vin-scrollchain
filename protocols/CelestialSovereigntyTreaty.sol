// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CelestialSovereigntyTreaty {
    address public steward;

    struct SovereigntyClause {
        string orbitalZone;
        string sovereigntyThreat;
        string defenseProtocol;
        string emotionalTag;
    }

    SovereigntyClause[] public treatyLog;

    event CelestialSovereigntyTagged(string orbitalZone, string sovereigntyThreat, string defenseProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSovereignty(
        string memory orbitalZone,
        string memory sovereigntyThreat,
        string memory defenseProtocol,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(SovereigntyClause(orbitalZone, sovereigntyThreat, defenseProtocol, emotionalTag));
        emit CelestialSovereigntyTagged(orbitalZone, sovereigntyThreat, defenseProtocol, emotionalTag);
    }
}
