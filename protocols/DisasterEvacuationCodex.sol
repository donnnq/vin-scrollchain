// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisasterEvacuationCodex {
    address public steward;

    struct EvacuationClause {
        string location;
        string disasterType;
        string evacuationRoute;
        string emotionalTag;
    }

    EvacuationClause[] public codex;

    event EvacuationLogged(string location, string disasterType, string evacuationRoute, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logEvacuation(
        string memory location,
        string memory disasterType,
        string memory evacuationRoute,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EvacuationClause(location, disasterType, evacuationRoute, emotionalTag));
        emit EvacuationLogged(location, disasterType, evacuationRoute, emotionalTag);
    }
}
