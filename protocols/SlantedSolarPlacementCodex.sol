// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SlantedSolarPlacementCodex {
    address public steward;

    struct SolarClause {
        string buildingName;
        string panelOrientation;
        string energyPartner;
        string emotionalTag;
    }

    SolarClause[] public codex;

    event SolarLogged(string buildingName, string panelOrientation, string energyPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logSolar(
        string memory buildingName,
        string memory panelOrientation,
        string memory energyPartner,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SolarClause(buildingName, panelOrientation, energyPartner, emotionalTag));
        emit SolarLogged(buildingName, panelOrientation, energyPartner, emotionalTag);
    }
}
