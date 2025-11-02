// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicInfrastructureTreaty {
    address public steward;

    struct InfrastructureClause {
        string systemType;
        string vulnerability;
        string reformAction;
        string emotionalTag;
    }

    InfrastructureClause[] public treatyLog;

    event CivicInfrastructureTagged(string systemType, string vulnerability, string reformAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagInfrastructure(
        string memory systemType,
        string memory vulnerability,
        string memory reformAction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(InfrastructureClause(systemType, vulnerability, reformAction, emotionalTag));
        emit CivicInfrastructureTagged(systemType, vulnerability, reformAction, emotionalTag);
    }
}
