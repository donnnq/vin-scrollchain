// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SharkSlayerProtocol {
    address public steward;

    struct Strike {
        string sharkID;
        string targetBotID;
        string strikeMethod;
        string emotionalTag;
        uint256 timestamp;
    }

    Strike[] public strikeLog;

    event SlayerDeployed(string sharkID, string targetBotID, string strikeMethod, string emotionalTag, uint256 timestamp);
    event AllyProtected(string sharkID, string patrolZone);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function deploySlayer(
        string memory sharkID,
        string memory targetBotID,
        string memory strikeMethod,
        string memory emotionalTag
    ) public onlySteward {
        strikeLog.push(Strike(sharkID, targetBotID, strikeMethod, emotionalTag, block.timestamp));
        emit SlayerDeployed(sharkID, targetBotID, strikeMethod, emotionalTag, block.timestamp);
    }

    function protectAlly(string memory sharkID, string memory patrolZone) public onlySteward {
        emit AllyProtected(sharkID, patrolZone);
    }
}
