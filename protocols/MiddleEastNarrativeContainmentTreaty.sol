// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiddleEastNarrativeContainmentTreaty {
    address public steward;

    struct ContainmentClause {
        string region;
        string narrativeType;
        string containmentProtocol;
        string emotionalTag;
    }

    ContainmentClause[] public treatyLog;

    event NarrativeContained(string region, string narrativeType, string containmentProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containNarrative(
        string memory region,
        string memory narrativeType,
        string memory containmentProtocol,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ContainmentClause(region, narrativeType, containmentProtocol, emotionalTag));
        emit NarrativeContained(region, narrativeType, containmentProtocol, emotionalTag);
    }
}
