// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelperBotRoboticsProtocol {
    address public steward;

    struct BotDeployment {
        string botID;
        string functionType;
        string deploymentZone;
        string emotionalTag;
    }

    BotDeployment[] public deploymentLog;

    event BotDeployed(string botID, string functionType, string deploymentZone, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function deployBot(
        string memory botID,
        string memory functionType,
        string memory deploymentZone,
        string memory emotionalTag
    ) public onlySteward {
        deploymentLog.push(BotDeployment(botID, functionType, deploymentZone, emotionalTag));
        emit BotDeployed(botID, functionType, deploymentZone, emotionalTag);
    }
}
