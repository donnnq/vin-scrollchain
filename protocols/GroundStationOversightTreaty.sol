// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GroundStationOversightTreaty {
    address public steward;

    struct OversightClause {
        string stationLocation;
        string oversightGap;
        string auditProtocol;
        string emotionalTag;
    }

    OversightClause[] public treatyLog;

    event GroundStationOversightTagged(string stationLocation, string oversightGap, string auditProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagOversight(
        string memory stationLocation,
        string memory oversightGap,
        string memory auditProtocol,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(OversightClause(stationLocation, oversightGap, auditProtocol, emotionalTag));
        emit GroundStationOversightTagged(stationLocation, oversightGap, auditProtocol, emotionalTag);
    }
}
