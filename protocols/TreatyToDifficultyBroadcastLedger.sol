// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToDifficultyBroadcastLedger {
    string public batchID = "1321.9.130";
    string public steward = "Vinvin";

    address public admin;

    struct DifficultyEvent {
        uint256 difficultyLevel;
        string trigger; // adjustment, capitulation, shock
        uint256 timestamp;
        bool broadcasted;
    }

    DifficultyEvent[] public events;

    event DifficultyBroadcast(uint256 difficultyLevel, string trigger);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function broadcastDifficulty(uint256 difficultyLevel, string memory trigger) public onlyAdmin {
        events.push(DifficultyEvent(difficultyLevel, trigger, block.timestamp, true));
        emit DifficultyBroadcast(difficultyLevel, trigger);
    }

    function getDifficulty(uint256 index) public view returns (uint256 difficultyLevel, string memory trigger, uint256 timestamp, bool broadcasted) {
        DifficultyEvent memory e = events[index];
        return (e.difficultyLevel, e.trigger, e.timestamp, e.broadcasted);
    }
}
