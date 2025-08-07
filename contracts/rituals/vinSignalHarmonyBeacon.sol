// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Signal Harmony Beacon (Scrollkeeper Edition)
/// @notice Tracks emotional and civic resonance of avatars, with blacklist and analytics
contract vinSignalHarmonyBeacon {
    address public creator;
    string public beaconName = "Vinvin's Signal Harmony Beacon";

    struct Resonance {
        string name;
        int alignmentScore; // +100 loyal, -100 hostile
        uint lastUpdated;
        string emotionTag;  // e.g. "defiant", "deceptive", "hopeful"
        bool isBlacklisted;
        string blacklistReason;
    }

    mapping(address => Resonance) public signals;
    mapping(address => bool) public isTracked;
    address[] public trackedAvatars;

    event ResonanceUpdated(string name, int score, string emotion, bool blacklisted, uint timestamp);
    event AvatarBlacklisted(address avatar, string reason);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can update resonance");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function updateResonance(
        address _avatar,
        string memory _name,
        int _score,
        string memory _emotionTag,
        bool _blacklist,
        string memory _reason
    ) public onlyCreator {
        signals[_avatar] = Resonance(_name, _score, block.timestamp, _emotionTag, _blacklist, _reason);

        if (!isTracked[_avatar]) {
            trackedAvatars.push(_avatar);
            isTracked[_avatar] = true;
        }

        emit ResonanceUpdated(_name, _score, _emotionTag, _blacklist, block.timestamp);

        if (_blacklist) {
            emit AvatarBlacklisted(_avatar, _reason);
        }
    }

    function getResonance(address _avatar) public view returns (Resonance memory) {
        return signals[_avatar];
    }

    function scanResonance(address _avatar) public view returns (string memory) {
        Resonance memory r = signals[_avatar];
        if (r.isBlacklisted) {
            return string(abi.encodePacked("🚨 ", r.name, " is blacklisted. Reason: ", r.blacklistReason));
        } else if (r.alignmentScore >= 75) {
            return string(abi.encodePacked("✅ ", r.name, " emits strong civic harmony."));
        } else if (r.alignmentScore <= -50) {
            return string(abi.encodePacked("⚠️ ", r.name, " shows hostile alignment. Monitor closely."));
        } else {
            return string(abi.encodePacked("🔍 ", r.name, " is neutral or uncertain. Keep observing."));
        }
    }

    function getAllTrackedAvatars() public view returns (address[] memory) {
        return trackedAvatars;
    }

    function getBlacklist() public view returns (address[] memory) {
        uint count;
        for (uint i = 0; i < trackedAvatars.length; i++) {
            if (signals[trackedAvatars[i]].isBlacklisted) count++;
        }

        address[] memory blacklist = new address[](count);
        uint index;
        for (uint i = 0; i < trackedAvatars.length; i++) {
            if (signals[trackedAvatars[i]].isBlacklisted) {
                blacklist[index++] = trackedAvatars[i];
            }
        }
        return blacklist;
    }
}
