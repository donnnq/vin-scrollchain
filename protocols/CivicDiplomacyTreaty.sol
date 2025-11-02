// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicDiplomacyTreaty {
    address public steward;

    struct DiplomacyClause {
        string cooperationDomain;
        string reformPath;
        string erasureRisk;
        string emotionalTag;
    }

    DiplomacyClause[] public treatyLog;

    event CivicDiplomacyTagged(string cooperationDomain, string reformPath, string erasureRisk, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDiplomacy(
        string memory cooperationDomain,
        string memory reformPath,
        string memory erasureRisk,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(DiplomacyClause(cooperationDomain, reformPath, erasureRisk, emotionalTag));
        emit CivicDiplomacyTagged(cooperationDomain, reformPath, erasureRisk, emotionalTag);
    }
}
