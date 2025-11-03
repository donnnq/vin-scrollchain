// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExoplanetDiplomacyCodex {
    address public steward;

    struct DiplomacyEntry {
        string exoplanetName;
        string diplomaticChallenge;
        string treatyProposal;
        string emotionalTag;
    }

    DiplomacyEntry[] public codex;

    event ExoplanetDiplomacyLogged(string exoplanetName, string diplomaticChallenge, string treatyProposal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logDiplomacy(
        string memory exoplanetName,
        string memory diplomaticChallenge,
        string memory treatyProposal,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(DiplomacyEntry(exoplanetName, diplomaticChallenge, treatyProposal, emotionalTag));
        emit ExoplanetDiplomacyLogged(exoplanetName, diplomaticChallenge, treatyProposal, emotionalTag);
    }
}
