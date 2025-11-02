// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicFreightAccessTreaty {
    address public steward;

    struct AccessClause {
        string corridor;
        string freightOperator;
        string accessLevel;
        string emotionalTag;
    }

    AccessClause[] public treatyLog;

    event FreightAccessTagged(string corridor, string freightOperator, string accessLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagAccess(
        string memory corridor,
        string memory freightOperator,
        string memory accessLevel,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(AccessClause(corridor, freightOperator, accessLevel, emotionalTag));
        emit FreightAccessTagged(corridor, freightOperator, accessLevel, emotionalTag);
    }
}
