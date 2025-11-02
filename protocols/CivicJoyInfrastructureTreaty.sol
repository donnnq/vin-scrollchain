// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicJoyInfrastructureTreaty {
    address public steward;

    struct InfrastructureClause {
        string city;
        string infrastructureType;
        string joyOutcome;
        string emotionalTag;
    }

    InfrastructureClause[] public treatyLog;

    event JoyInfrastructureTagged(string city, string infrastructureType, string joyOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagJoyInfrastructure(
        string memory city,
        string memory infrastructureType,
        string memory joyOutcome,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(InfrastructureClause(city, infrastructureType, joyOutcome, emotionalTag));
        emit JoyInfrastructureTagged(city, infrastructureType, joyOutcome, emotionalTag);
    }
}
