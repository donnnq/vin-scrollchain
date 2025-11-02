// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanAirspaceSovereigntyTreaty {
    address public steward;

    struct AirspaceClause {
        string corridor;
        string usageType;
        string sovereigntyStatus;
        string emotionalTag;
    }

    AirspaceClause[] public treatyLog;

    event AirspaceTagged(string corridor, string usageType, string sovereigntyStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAirspace(
        string memory corridor,
        string memory usageType,
        string memory sovereigntyStatus,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(AirspaceClause(corridor, usageType, sovereigntyStatus, emotionalTag));
        emit AirspaceTagged(corridor, usageType, sovereigntyStatus, emotionalTag);
    }
}
