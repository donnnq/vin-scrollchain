// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EvacuationRouteAuditProtocol {
    address public steward;

    struct RouteAudit {
        string barangay;
        string timestamp;
        string routeStatus;
        string accessibilityNotes;
        string emotionalTag;
    }

    RouteAudit[] public audits;

    event RouteAudited(string barangay, string timestamp, string routeStatus, string accessibilityNotes, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditRoute(
        string memory barangay,
        string memory timestamp,
        string memory routeStatus,
        string memory accessibilityNotes,
        string memory emotionalTag
    ) public onlySteward {
        audits.push(RouteAudit(barangay, timestamp, routeStatus, accessibilityNotes, emotionalTag));
        emit RouteAudited(barangay, timestamp, routeStatus, accessibilityNotes, emotionalTag);
    }
}
