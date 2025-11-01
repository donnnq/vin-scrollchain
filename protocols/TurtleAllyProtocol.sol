// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TurtleAllyProtocol {
    address public steward;

    struct AllyPatrol {
        string turtleID;
        string patrolZone;
        string detectedEntity;
        bool isImpostor;
    }

    AllyPatrol[] public patrolLog;

    event AllyVerified(string turtleID, string patrolZone);
    event ImpostorNeutralized(string turtleID, string detectedEntity);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function verifyAlly(string memory turtleID, string memory patrolZone) public onlySteward {
        emit AllyVerified(turtleID, patrolZone);
    }

    function neutralizeImpostor(string memory turtleID, string memory detectedEntity) public onlySteward {
        patrolLog.push(AllyPatrol(turtleID, "", detectedEntity, true));
        emit ImpostorNeutralized(turtleID, detectedEntity);
    }
}
