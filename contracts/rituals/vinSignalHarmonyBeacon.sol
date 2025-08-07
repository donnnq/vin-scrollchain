// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Signal Harmony Beacon
/// @notice Tracks emotional and civic resonance of avatars
contract vinSignalHarmonyBeacon {
    address public creator;
    string public beaconName = "Vinvin's Signal Harmony Beacon";

    struct Resonance {
        string name;
        int alignmentScore; // +100 loyal, -100 hostile
        uint lastUpdated;
    }

    mapping(address => Resonance) public signals;
    address[] public trackedAvatars;

    event ResonanceUpdated(string name, int score, uint timestamp);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can update resonance");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function updateResonance(address _avatar, string memory _name, int _score) public onlyCreator {
        signals[_avatar] = Resonance(_name, _score, block.timestamp);
        trackedAvatars.push(_avatar);
        emit ResonanceUpdated(_name, _score, block.timestamp);
    }

    function getResonance(address _avatar) public view returns (Resonance memory) {
        return signals[_avatar];
    }

    function getAllTrackedAvatars() public view returns (address[] memory) {
        return trackedAvatars;
    }
}
