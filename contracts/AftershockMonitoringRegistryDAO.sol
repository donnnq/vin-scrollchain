// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AftershockMonitoringRegistryDAO {
    address public steward;

    struct AftershockEvent {
        string region;
        string magnitude;
        string depth;
        string responseAction; // "Monitoring", "Evacuation", "Audit", "Alert Issued"
        string emotionalTag;
        uint256 timestamp;
    }

    AftershockEvent[] public events;

    event AftershockLogged(
        string region,
        string magnitude,
        string depth,
        string responseAction,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log aftershock monitoring rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAftershock(
        string memory region,
        string memory magnitude,
        string memory depth,
        string memory responseAction,
        string memory emotionalTag
    ) external onlySteward {
        events.push(AftershockEvent({
            region: region,
            magnitude: magnitude,
            depth: depth,
            responseAction: responseAction,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AftershockLogged(region, magnitude, depth, responseAction, emotionalTag, block.timestamp);
    }

    function getAftershockByIndex(uint256 index) external view returns (
        string memory region,
        string memory magnitude,
        string memory depth,
        string memory responseAction,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        AftershockEvent memory a = events[index];
        return (
            a.region,
            a.magnitude,
            a.depth,
            a.responseAction,
            a.emotionalTag,
            a.timestamp
        );
    }
}
