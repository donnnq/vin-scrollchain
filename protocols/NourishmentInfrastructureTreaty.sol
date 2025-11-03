// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NourishmentInfrastructureTreaty {
    address public steward;

    struct InfrastructureClause {
        string foodProgram;
        string systemWeakness;
        string restorationAction;
        string emotionalTag;
    }

    InfrastructureClause[] public treatyLog;

    event NourishmentInfrastructureTagged(string foodProgram, string systemWeakness, string restorationAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagInfrastructure(
        string memory foodProgram,
        string memory systemWeakness,
        string memory restorationAction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(InfrastructureClause(foodProgram, systemWeakness, restorationAction, emotionalTag));
        emit NourishmentInfrastructureTagged(foodProgram, systemWeakness, restorationAction, emotionalTag);
    }
}
