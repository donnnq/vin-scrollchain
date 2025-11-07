// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayFloodResilienceIndex {
    address public steward;

    struct ResilienceEntry {
        string barangay;
        string timestamp;
        string evacuationRouteStatus;
        string drainageHealth;
        string drillFrequency;
        string emotionalTag;
    }

    ResilienceEntry[] public index;

    event ResilienceLogged(string barangay, string timestamp, string evacuationRouteStatus, string drainageHealth, string drillFrequency, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logResilience(
        string memory barangay,
        string memory timestamp,
        string memory evacuationRouteStatus,
        string memory drainageHealth,
        string memory drillFrequency,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ResilienceEntry(barangay, timestamp, evacuationRouteStatus, drainageHealth, drillFrequency, emotionalTag));
        emit ResilienceLogged(barangay, timestamp, evacuationRouteStatus, drainageHealth, drillFrequency, emotionalTag);
    }
}
