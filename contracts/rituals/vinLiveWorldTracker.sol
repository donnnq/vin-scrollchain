// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinLiveWorldTracker {
    struct LiveZone {
        string name;
        bool online;
        uint256 inhabitants;
        uint256 lastPing;
        string activityGlyph;
    }

    mapping(uint256 => LiveZone) public feed;
    uint256 public trackerCounter;

    event ZonePinged(
        uint256 indexed zoneId,
        string name,
        bool online,
        string activityGlyph,
        uint256 timestamp
    );

    function activateZone(string memory _name, uint256 _inhabitants) public {
        feed[trackerCounter] = LiveZone({
            name: _name,
            online: true,
            inhabitants: _inhabitants,
            lastPing: block.timestamp,
            activityGlyph: "🟢 stable"
        });

        emit ZonePinged(trackerCounter, _name, true, "🟢 stable", block.timestamp);
        trackerCounter++;
    }

    function updatePing(uint256 _zoneId, bool _status, string memory _glyph) public {
        LiveZone storage zone = feed[_zoneId];
        zone.online = _status;
        zone.lastPing = block.timestamp;
        zone.activityGlyph = _glyph;

        emit ZonePinged(_zoneId, zone.name, _status, _glyph, block.timestamp);
    }

    function getLiveStatus(uint256 _id) public view returns (LiveZone memory) {
        return feed[_id];
    }
}
