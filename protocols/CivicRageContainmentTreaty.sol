// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicRageContainmentTreaty {
    address public steward;

    struct ContainmentClause {
        string rageTrigger;
        string containmentMethod;
        string civicOutcome;
        string emotionalTag;
    }

    ContainmentClause[] public treatyLog;

    event CivicRageContained(string rageTrigger, string containmentMethod, string civicOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containRage(
        string memory rageTrigger,
        string memory containmentMethod,
        string memory civicOutcome,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ContainmentClause(rageTrigger, containmentMethod, civicOutcome, emotionalTag));
        emit CivicRageContained(rageTrigger, containmentMethod, civicOutcome, emotionalTag);
    }
}
