// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicMuralImmunityCodex {
    address public steward;

    struct MuralClause {
        string muralTitle;
        string artistName;
        string corridor;
        string emotionalTag;
    }

    MuralClause[] public codex;

    event MuralLogged(string muralTitle, string artistName, string corridor, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logMural(
        string memory muralTitle,
        string memory artistName,
        string memory corridor,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(MuralClause(muralTitle, artistName, corridor, emotionalTag));
        emit MuralLogged(muralTitle, artistName, corridor, emotionalTag);
    }
}
