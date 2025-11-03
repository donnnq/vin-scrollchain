// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SatelliteBreachCodex {
    address public steward;

    struct BreachEntry {
        string breachType;
        string affectedOrbit;
        string containmentAction;
        string emotionalTag;
    }

    BreachEntry[] public codex;

    event SatelliteBreachLogged(string breachType, string affectedOrbit, string containmentAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logBreach(
        string memory breachType,
        string memory affectedOrbit,
        string memory containmentAction,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(BreachEntry(breachType, affectedOrbit, containmentAction, emotionalTag));
        emit SatelliteBreachLogged(breachType, affectedOrbit, containmentAction, emotionalTag);
    }
}
