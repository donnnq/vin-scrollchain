// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelmetFreeCorridorCodex {
    address public steward;

    struct CorridorClause {
        string location;
        string corridorType;
        string safetyProtocol;
        string emotionalTag;
    }

    CorridorClause[] public codex;

    event HelmetFreeCorridorLogged(string location, string corridorType, string safetyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logHelmetFreeCorridor(
        string memory location,
        string memory corridorType,
        string memory safetyProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(CorridorClause(location, corridorType, safetyProtocol, emotionalTag));
        emit HelmetFreeCorridorLogged(location, corridorType, safetyProtocol, emotionalTag);
    }
}
