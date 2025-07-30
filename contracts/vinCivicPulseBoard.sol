// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinCivicPulseBoard.sol
/// @notice Tracks patrol presence, civic tension scores, and zone activation status.

contract vinCivicPulseBoard {
    address public scrollsmith;

    struct ZonePulse {
        string zoneName;
        uint256 tensionScore;
        uint256 patrolCount;
        bool active;
    }

    mapping(address => ZonePulse) public pulseRegistry;

    event PulseUpdated(address indexed zone, string zoneName, uint256 tensionScore, uint256 patrolCount);
    event ZoneActivated(address indexed zone, string zoneName);
    event ZoneDeactivated(address indexed zone, string zoneName);

    constructor() {
        scrollsmith = msg.sender;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Unauthorized scrollsmith");
        _;
    }

    function updatePulse(address zone, string memory zoneName, uint256 tensionScore, uint256 patrolCount) public onlyScrollsmith {
        pulseRegistry[zone] = ZonePulse(zoneName, tensionScore, patrolCount, true);
        emit PulseUpdated(zone, zoneName, tensionScore, patrolCount);
    }

    function activateZone(address zone, string memory zoneName) public onlyScrollsmith {
        pulseRegistry[zone].active = true;
        pulseRegistry[zone].zoneName = zoneName;
        emit ZoneActivated(zone, zoneName);
    }

    function deactivateZone(address zone) public onlyScrollsmith {
        pulseRegistry[zone].active = false;
        emit ZoneDeactivated(zone, pulseRegistry[zone].zoneName);
    }

    function getPulse(address zone) public view returns (ZonePulse memory) {
        return pulseRegistry[zone];
    }
}
