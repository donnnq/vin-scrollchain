// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinPacificPulseDashboard {
    struct NavalEvent {
        string vesselName;
        string region;
        string eventType; // "Trespass", "Deployment", "SignalDisruption"
        uint256 timestamp;
    }

    NavalEvent[] public events;

    event PulseLogged(string vesselName, string region, string eventType, uint256 timestamp);

    function logEvent(string memory vesselName, string memory region, string memory eventType) public {
        events.push(NavalEvent(vesselName, region, eventType, block.timestamp));
        emit PulseLogged(vesselName, region, eventType, block.timestamp);
    }

    function getRecentEvents(uint count) public view returns (NavalEvent[] memory) {
        require(count <= events.length, "Not enough events logged.");
        NavalEvent[] memory recent = new NavalEvent[](count);
        for (uint i = 0; i < count; i++) {
            recent[i] = events[events.length - 1 - i];
        }
        return recent;
    }
}
