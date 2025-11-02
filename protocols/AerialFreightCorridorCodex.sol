// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AerialFreightCorridorCodex {
    address public steward;

    struct FreightClause {
        string corridorName;
        string cargoType;
        string routingProtocol;
        string emotionalTag;
    }

    FreightClause[] public codex;

    event FreightCorridorLogged(string corridorName, string cargoType, string routingProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logFreightCorridor(
        string memory corridorName,
        string memory cargoType,
        string memory routingProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(FreightClause(corridorName, cargoType, routingProtocol, emotionalTag));
        emit FreightCorridorLogged(corridorName, cargoType, routingProtocol, emotionalTag);
    }
}
