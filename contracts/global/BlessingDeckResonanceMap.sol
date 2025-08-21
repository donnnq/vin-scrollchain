// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract BlessingDeckResonanceMap {
    struct StewardResonance {
        string steward;
        string region;
        string coordinates; // e.g. "14.837°N, 120.811°E"
        uint256 aprScore;
        uint256 blessingsReceived;
        uint256 scansTriggered;
        uint256 timestamp;
    }

    StewardResonance[] public resonanceMap;

    event ResonanceLogged(string steward, string region, uint256 aprScore);

    function logResonance(
        string memory _steward,
        string memory _region,
        string memory _coordinates,
        uint256 _aprScore,
        uint256 _blessingsReceived,
        uint256 _scansTriggered
    ) public {
        resonanceMap.push(StewardResonance({
            steward: _steward,
            region: _region,
            coordinates: _coordinates,
            aprScore: _aprScore,
            blessingsReceived: _blessingsReceived,
            scansTriggered: _scansTriggered,
            timestamp: block.timestamp
        }));

        emit ResonanceLogged(_steward, _region, _aprScore);
    }

    function getResonanceMap() public view returns (StewardResonance[] memory) {
        return resonanceMap;
    }
}
