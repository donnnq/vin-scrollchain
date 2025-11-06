// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeatIslandImmunityTreaty {
    address public steward;

    struct ImmunityClause {
        string location;
        string urbanDensity;
        string mitigationProtocol;
        string emotionalTag;
    }

    ImmunityClause[] public treatyLog;

    event HeatIslandImmunityTagged(string location, string urbanDensity, string mitigationProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory location,
        string memory urbanDensity,
        string memory mitigationProtocol,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ImmunityClause(location, urbanDensity, mitigationProtocol, emotionalTag));
        emit HeatIslandImmunityTagged(location, urbanDensity, mitigationProtocol, emotionalTag);
    }
}
