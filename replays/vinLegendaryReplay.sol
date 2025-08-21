// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinLegendaryReplay {
    struct Replay {
        string ritualName;
        string steward;
        string scrollsIncluded;
        string replayNote;
        uint256 timestamp;
    }

    Replay[] public replays;

    event RitualReplayed(string ritualName, string steward, string scrollsIncluded);

    function replayRitual(
        string memory ritualName,
        string memory steward,
        string memory scrollsIncluded,
        string memory replayNote
    ) public {
        replays.push(Replay(ritualName, steward, scrollsIncluded, replayNote, block.timestamp));
        emit RitualReplayed(ritualName, steward, scrollsIncluded);
    }

    function getReplays() public view returns (Replay[] memory) {
        return replays;
    }
}
