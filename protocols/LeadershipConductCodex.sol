// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LeadershipConductCodex {
    address public steward;

    struct ConductEntry {
        string leaderName;
        string behaviorType;
        string crewImpact;
        string emotionalTag;
    }

    ConductEntry[] public codex;

    event LeadershipConductLogged(string leaderName, string behaviorType, string crewImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logConduct(
        string memory leaderName,
        string memory behaviorType,
        string memory crewImpact,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ConductEntry(leaderName, behaviorType, crewImpact, emotionalTag));
        emit LeadershipConductLogged(leaderName, behaviorType, crewImpact, emotionalTag);
    }
}
