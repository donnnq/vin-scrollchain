// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract BlessingDeckStewardPulse {
    struct StewardPulse {
        string steward;
        uint256 aprScore;
        uint256 blessingsReceived;
        uint256 scansTriggered;
        uint256 lastActive;
    }

    mapping(string => StewardPulse) public pulses;

    event PulseUpdated(string steward, uint256 aprScore, uint256 blessingsReceived);

    function updatePulse(
        string memory _steward,
        uint256 _aprScore,
        bool blessingReceived,
        bool scanTriggered
    ) public {
        StewardPulse storage pulse = pulses[_steward];
        pulse.aprScore = _aprScore;
        if (blessingReceived) pulse.blessingsReceived += 1;
        if (scanTriggered) pulse.scansTriggered += 1;
        pulse.lastActive = block.timestamp;

        emit PulseUpdated(_steward, _aprScore, pulse.blessingsReceived);
    }

    function getPulse(string memory _steward) public view returns (StewardPulse memory) {
        return pulses[_steward];
    }
}
