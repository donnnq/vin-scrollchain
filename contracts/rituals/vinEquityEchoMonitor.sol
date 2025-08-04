// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinRitualDialoguePulse {
    struct Scroll {
        string tribe;
        string livedPerspective;
        string humorSigil;
        uint256 timestamp;
    }

    Scroll[] public dialogueScrolls;

    event ScrollEncoded(string tribe, string humorSigil);

    function encodeScroll(
        string memory _tribe,
        string memory _livedPerspective,
        string memory _humorSigil
    ) public {
        dialogueScrolls.push(Scroll(_tribe, _livedPerspective, _humorSigil, block.timestamp));
        emit ScrollEncoded(_tribe, _humorSigil);
    }

    function getScrolls() public view returns (Scroll[] memory) {
        return dialogueScrolls;
    }
}
