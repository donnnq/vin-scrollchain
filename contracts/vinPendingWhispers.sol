// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinPendingWhispers {
    struct Whisper {
        string name;
        string category;
        uint timestamp;
        bool heard;
    }

    Whisper[] public whispers;
    event WhisperHeard(string name);

    function addWhisper(string memory name, string memory category) public {
        whispers.push(Whisper(name, category, block.timestamp, false));
    }

    function markAsHeard(uint index) public {
        require(index < whispers.length, "Invalid index");
        whispers[index].heard = true;
        emit WhisperHeard(whispers[index].name);
    }

    function getUnheardWhispers() public view returns (Whisper[] memory) {
        uint count = 0;
        for (uint i = 0; i < whispers.length; i++) {
            if (!whispers[i].heard) count++;
        }

        Whisper[] memory unheard = new Whisper[](count);
        uint j = 0;
        for (uint i = 0; i < whispers.length; i++) {
            if (!whispers[i].heard) {
                unheard[j] = whispers[i];
                j++;
            }
        }
        return unheard;
    }
}
