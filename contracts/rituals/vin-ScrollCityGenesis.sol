// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinScrollCityGenesis {
    struct Zone {
        string name;
        bool isUpgraded;
        uint256 lastUpdate;
        uint256 inhabitants;
        bool suspiciousActivity;
    }

    mapping(uint256 => Zone) public zones;
    uint256 public zoneCounter;

    event ZoneUpgraded(
        uint256 indexed zoneId,
        string name,
        uint256 inhabitants,
        bool suspiciousActivity,
        string auraStatus
    );

    function registerZone(string memory _name, uint256 _inhabitants) public {
        zones[zoneCounter] = Zone({
            name: _name,
            isUpgraded: false,
            lastUpdate: block.timestamp,
            inhabitants: _inhabitants,
            suspiciousActivity: false
        });

        zoneCounter++;
    }

    function upgradeZone(uint256 _zoneId, bool _suspectedHack) public {
        Zone storage zone = zones[_zoneId];
        zone.isUpgraded = true;
        zone.lastUpdate = block.timestamp;
        zone.suspiciousActivity = _suspectedHack;

        string memory aura = _suspectedHack ? "Hacker alert activated" : "Aura integrity sustained";

        emit ZoneUpgraded(
            _zoneId,
            zone.name,
            zone.inhabitants,
            _suspectedHack,
            aura
        );
    }

    function getZone(uint256 _id) public view returns (Zone memory) {
        return zones[_id];
    }
}
