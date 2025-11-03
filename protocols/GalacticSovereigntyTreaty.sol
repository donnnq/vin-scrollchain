// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GalacticSovereigntyTreaty {
    address public steward;

    struct SovereigntyClause {
        string galacticRegion;
        string sovereigntyThreat;
        string defenseProtocol;
        string emotionalTag;
    }

    SovereigntyClause[] public treatyLog;

    event GalacticSovereigntyTagged(string galacticRegion, string sovereigntyThreat, string defenseProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSovereignty(
        string memory galacticRegion,
        string memory sovereigntyThreat,
        string memory defenseProtocol,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(SovereigntyClause(galacticRegion, sovereigntyThreat, defenseProtocol, emotionalTag));
        emit GalacticSovereigntyTagged(galacticRegion, sovereigntyThreat, defenseProtocol, emotionalTag);
    }
}
