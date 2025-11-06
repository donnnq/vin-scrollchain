// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BulacanFloodJusticeTreaty {
    address public steward;

    struct JusticeClause {
        string municipality;
        string floodSeverity;
        string equityDemand;
        string emotionalTag;
    }

    JusticeClause[] public treatyLog;

    event FloodJusticeTagged(string municipality, string floodSeverity, string equityDemand, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagJustice(
        string memory municipality,
        string memory floodSeverity,
        string memory equityDemand,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(JusticeClause(municipality, floodSeverity, equityDemand, emotionalTag));
        emit FloodJusticeTagged(municipality, floodSeverity, equityDemand, emotionalTag);
    }
}
