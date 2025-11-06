// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommunityMonitoringDAO {
    address public steward;

    struct MonitoringEntry {
        string barangay;
        string issueTagged;
        string communityRole;
        string emotionalTag;
    }

    MonitoringEntry[] public registry;

    event CommunityMonitoringBroadcasted(string barangay, string issueTagged, string communityRole, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastMonitoring(
        string memory barangay,
        string memory issueTagged,
        string memory communityRole,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(MonitoringEntry(barangay, issueTagged, communityRole, emotionalTag));
        emit CommunityMonitoringBroadcasted(barangay, issueTagged, communityRole, emotionalTag);
    }
}
