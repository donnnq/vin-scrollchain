// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicInfrastructureRestorationTreaty {
    address public steward;

    struct RestorationClause {
        string location;
        string infrastructureType;
        string restorationAction;
        string emotionalTag;
    }

    RestorationClause[] public treatyLog;

    event InfrastructureRestored(string location, string infrastructureType, string restorationAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function restoreInfrastructure(
        string memory location,
        string memory infrastructureType,
        string memory restorationAction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(RestorationClause(location, infrastructureType, restorationAction, emotionalTag));
        emit InfrastructureRestored(location, infrastructureType, restorationAction, emotionalTag);
    }
}
