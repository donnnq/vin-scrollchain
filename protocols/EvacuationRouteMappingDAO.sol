// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EvacuationRouteMappingDAO {
    address public steward;

    struct RouteEntry {
        string barangay;
        string timestamp;
        string routeName;
        string accessibilityStatus;
        string signageStatus;
        string emotionalTag;
    }

    RouteEntry[] public routes;

    event RouteMapped(string barangay, string routeName, string timestamp, string accessibilityStatus, string signageStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function mapRoute(
        string memory barangay,
        string memory routeName,
        string memory timestamp,
        string memory accessibilityStatus,
        string memory signageStatus,
        string memory emotionalTag
    ) public onlySteward {
        routes.push(RouteEntry(barangay, timestamp, routeName, accessibilityStatus, signageStatus, emotionalTag));
        emit RouteMapped(barangay, routeName, timestamp, accessibilityStatus, signageStatus, emotionalTag);
    }
}
