// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TurtleSentinel {
    address public steward;

    struct Patrol {
        string turtleID;
        string patrolZone;
        string jellyfishBotID;
        string actionTaken;
    }

    Patrol[] public patrolLog;

    event JellyfishNeutralized(string turtleID, string jellyfishBotID, string actionTaken);
    event PatrolLogged(string turtleID, string patrolZone);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logPatrol(string memory turtleID, string memory patrolZone) public onlySteward {
        patrolLog.push(Patrol(turtleID, patrolZone, "", ""));
        emit PatrolLogged(turtleID, patrolZone);
    }

    function neutralizeJellyfish(
        string memory turtleID,
        string memory jellyfishBotID,
        string memory actionTaken
    ) public onlySteward {
        patrolLog.push(Patrol(turtleID, "", jellyfishBotID, actionTaken));
        emit JellyfishNeutralized(turtleID, jellyfishBotID, actionTaken);
    }
}
