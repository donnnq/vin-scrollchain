// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthRoboticsDAO {
    address public steward;

    struct RoboticsEntry {
        string initiativeName;
        string roboticsFocus;
        string deploymentMechanism;
        string emotionalTag;
    }

    RoboticsEntry[] public registry;

    event YouthRoboticsTagged(string initiativeName, string roboticsFocus, string deploymentMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRobotics(
        string memory initiativeName,
        string memory roboticsFocus,
        string memory deploymentMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(RoboticsEntry(initiativeName, roboticsFocus, deploymentMechanism, emotionalTag));
        emit YouthRoboticsTagged(initiativeName, roboticsFocus, deploymentMechanism, emotionalTag);
    }
}
