// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinSubmarineWhisper {
    struct Whisper {
        string subName;
        string region;
        uint256 silenceLevel; // 0–100
        uint256 timestamp;
    }

    mapping(string => bool) public isSilent;
    Whisper[] public whispers;

    event SubSilenced(string subName, string region, uint256 silenceLevel, uint256 timestamp);

    function activateWhisper(string memory subName, string memory region, uint256 silenceLevel) public {
        require(silenceLevel <= 100, "Too loud for the abyss.");
        isSilent[subName] = true;
        whispers.push(Whisper(subName, region, silenceLevel, block.timestamp));
        emit SubSilenced(subName, region, silenceLevel, block.timestamp);
    }

    function surfaceSub(string memory subName) public {
        isSilent[subName] = false;
    }

    function getRecentWhispers(uint count) public view returns (Whisper[] memory) {
        require(count <= whispers.length, "Not enough whispers.");
        Whisper[] memory recent = new Whisper[](count);
        for (uint i = 0; i < count; i++) {
            recent[i] = whispers[whispers.length - 1 - i];
        }
        return recent;
    }
}
