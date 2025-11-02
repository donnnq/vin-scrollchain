// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PedestrianRitualCodex {
    address public steward;

    struct RitualClause {
        string location;
        string crossingType;
        string ritualPurpose;
        string emotionalTag;
    }

    RitualClause[] public codex;

    event PedestrianRitualLogged(string location, string crossingType, string ritualPurpose, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logRitual(
        string memory location,
        string memory crossingType,
        string memory ritualPurpose,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(RitualClause(location, crossingType, ritualPurpose, emotionalTag));
        emit PedestrianRitualLogged(location, crossingType, ritualPurpose, emotionalTag);
    }
}
