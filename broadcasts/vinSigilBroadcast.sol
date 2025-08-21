// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinSigilBroadcast {
    struct SigilMessage {
        string steward;
        string nation;
        string sigilName;
        string glyphMeaning;
        string broadcastNote;
        uint256 timestamp;
    }

    SigilMessage[] public sigilBroadcasts;

    event SigilBroadcasted(string steward, string nation, string sigilName, string broadcastNote);

    function broadcastSigil(
        string memory steward,
        string memory nation,
        string memory sigilName,
        string memory glyphMeaning,
        string memory broadcastNote
    ) public {
        sigilBroadcasts.push(SigilMessage(steward, nation, sigilName, glyphMeaning, broadcastNote, block.timestamp));
        emit SigilBroadcasted(steward, nation, sigilName, broadcastNote);
    }

    function getBroadcasts() public view returns (SigilMessage[] memory) {
        return sigilBroadcasts;
    }
}
