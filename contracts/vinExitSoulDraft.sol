// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinExitSoulDraft {
    struct ExitNote {
        address sender;
        string message;
        uint256 timestamp;
    }

    ExitNote[] public notes;

    function submitExitNote(string memory message) public {
        notes.push(ExitNote(msg.sender, message, block.timestamp));
    }

    function getNote(uint index) public view returns (ExitNote memory) {
        return notes[index];
    }

    function totalNotes() public view returns (uint) {
        return notes.length;
    }
}
