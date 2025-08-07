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
    }

    mapping(address => Resonance) public signals;
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
        bool _blacklist
    ) public onlyCreator {
        signals[_avatar] = Resonance(_name, _score, block.timestamp, _emotionTag, _blacklist);
        trackedAvatars.push(_avatar);
        emit ResonanceUpdated(_name, _score, _emotionTag, _blacklist, block.timestamp);

        if (_blacklist) {
            emit AvatarBlacklisted(_avatar, "Scrollkeeper flagged for civic misalignment");
        }
    }

    function getResonance(address _avatar) public view returns (Resonance memory) {
        return signals[_avatar];
    }

    function getAllTrackedAvatars() public view returns (address[] memory) {
        return trackedAvatars;
    }

    function getBlacklist() public view returns (address[] memory) {
        uint count = 0;
        for (uint i = 0; i < trackedAvatars.length; i++) {
            if (signals[trackedAvatars[i]].isBlacklisted) {
                count++;
            }
        }

        address[] memory blacklist = new address[](count);
        uint index = 0;
        for (uint i = 0; i < trackedAvatars.length; i++) {
            if (signals[trackedAvatars[i]].isBlacklisted) {
                blacklist[index++] = trackedAvatars[i];
            }
        }
        return blacklist;
    }
}
