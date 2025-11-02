// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicRailAccessTreaty {
    address public steward;

    struct AccessClause {
        string corridor;
        string accessType;
        string equityConcern;
        string emotionalTag;
    }

    AccessClause[] public treatyLog;

    event RailAccessTagged(string corridor, string accessType, string equityConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagAccess(
        string memory corridor,
        string memory accessType,
        string memory equityConcern,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(AccessClause(corridor, accessType, equityConcern, emotionalTag));
        emit RailAccessTagged(corridor, accessType, equityConcern, emotionalTag);
    }
}
