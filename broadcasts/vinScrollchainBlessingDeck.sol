// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinScrollchainBlessingDeck {
    struct BlessingBroadcast {
        string scrollName;
        string steward;
        string broadcastMessage;
        string nanoPath;
        uint256 timestamp;
    }

    BlessingBroadcast[] public broadcasts;

    event BlessingAnnounced(string scrollName, string steward, string broadcastMessage);

    function announceBlessing(
        string memory scrollName,
        string memory steward,
        string memory broadcastMessage,
        string memory nanoPath
    ) public {
        broadcasts.push(BlessingBroadcast(scrollName, steward, broadcastMessage, nanoPath, block.timestamp));
        emit BlessingAnnounced(scrollName, steward, broadcastMessage);
    }

    function getBroadcasts() public view returns (BlessingBroadcast[] memory) {
        return broadcasts;
    }
}
