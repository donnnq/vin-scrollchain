// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AltcoinCapitulationBroadcastDAO {
    address public steward;

    struct Broadcast {
        string token;
        uint256 indexScore;
        string timestamp;
        string sentiment;
        string emotionalTag;
    }

    Broadcast[] public broadcasts;

    event CapitulationBroadcasted(string token, uint256 indexScore, string timestamp, string sentiment, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastCapitulation(
        string memory token,
        uint256 indexScore,
        string memory timestamp,
        string memory sentiment,
        string memory emotionalTag
    ) public onlySteward {
        broadcasts.push(Broadcast(token, indexScore, timestamp, sentiment, emotionalTag));
        emit CapitulationBroadcasted(token, indexScore, timestamp, sentiment, emotionalTag);
    }
}
