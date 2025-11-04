// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TeacherEquityTreaty {
    address public steward;

    struct EquityClause {
        string region;
        string equitySignal;
        string supportMechanism;
        string emotionalTag;
    }

    EquityClause[] public treatyLog;

    event TeacherEquityTagged(string region, string equitySignal, string supportMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEquity(
        string memory region,
        string memory equitySignal,
        string memory supportMechanism,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(EquityClause(region, equitySignal, supportMechanism, emotionalTag));
        emit TeacherEquityTagged(region, equitySignal, supportMechanism, emotionalTag);
    }
}
