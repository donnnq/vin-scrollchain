// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ComedicGovernanceCodex {
    address public steward;

    struct GovernanceClause {
        string ritualName;
        string humorType;
        string civicFunction;
        string emotionalTag;
    }

    GovernanceClause[] public codex;

    event RitualCodified(string ritualName, string humorType, string civicFunction);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function codifyRitual(
        string memory ritualName,
        string memory humorType,
        string memory civicFunction,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(GovernanceClause(ritualName, humorType, civicFunction, emotionalTag));
        emit RitualCodified(ritualName, humorType, civicFunction);
    }
}
