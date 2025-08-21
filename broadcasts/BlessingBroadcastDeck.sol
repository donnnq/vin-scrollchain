// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract BlessingBroadcastDeck {
    struct Broadcast {
        string nation;
        string steward;
        string message;
        uint256 timestamp;
    }

    Broadcast[] public broadcasts;

    event BlessingSent(string nation, string steward, string message, uint256 timestamp);

    function sendBlessing(string memory nation, string memory steward, string memory message) public {
        broadcasts.push(Broadcast(nation, steward, message, block.timestamp));
        emit BlessingSent(nation, steward, message, block.timestamp);
    }

    function getBroadcasts() public view returns (Broadcast[] memory) {
        return broadcasts;
    }
}
