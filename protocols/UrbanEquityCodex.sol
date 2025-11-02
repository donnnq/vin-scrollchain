// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanEquityCodex {
    address public steward;

    struct EquityClause {
        string district;
        string infrastructureType;
        string equityVerdict;
        string emotionalTag;
    }

    EquityClause[] public codex;

    event EquityLogged(string district, string infrastructureType, string equityVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logEquity(
        string memory district,
        string memory infrastructureType,
        string memory equityVerdict,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EquityClause(district, infrastructureType, equityVerdict, emotionalTag));
        emit EquityLogged(district, infrastructureType, equityVerdict, emotionalTag);
    }
}
