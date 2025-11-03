// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryDefenseTreaty {
    address public steward;

    struct DefenseClause {
        string threatType;
        string defenseProtocol;
        string sovereigntyOutcome;
        string emotionalTag;
    }

    DefenseClause[] public treatyLog;

    event PlanetaryDefenseTagged(string threatType, string defenseProtocol, string sovereigntyOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDefense(
        string memory threatType,
        string memory defenseProtocol,
        string memory sovereigntyOutcome,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(DefenseClause(threatType, defenseProtocol, sovereigntyOutcome, emotionalTag));
        emit PlanetaryDefenseTagged(threatType, defenseProtocol, sovereigntyOutcome, emotionalTag);
    }
}
