// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SolarLaborSovereigntyCodex {
    address public steward;

    struct SolarClause {
        string city;
        string solarTask;
        string laborPartner;
        string emotionalTag;
    }

    SolarClause[] public codex;

    event SolarLaborLogged(string city, string solarTask, string laborPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logSolarLabor(
        string memory city,
        string memory solarTask,
        string memory laborPartner,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SolarClause(city, solarTask, laborPartner, emotionalTag));
        emit SolarLaborLogged(city, solarTask, laborPartner, emotionalTag);
    }
}
