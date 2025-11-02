// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForthwithDeploymentGrid {
    address public steward;

    struct DeploymentNode {
        string officialName;
        string corridor;
        string urgencyLevel;
        string emotionalTag;
    }

    DeploymentNode[] public grid;

    event DeploymentActivated(string officialName, string corridor, string urgencyLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function activateDeployment(
        string memory officialName,
        string memory corridor,
        string memory urgencyLevel,
        string memory emotionalTag
    ) public onlySteward {
        grid.push(DeploymentNode(officialName, corridor, urgencyLevel, emotionalTag));
        emit DeploymentActivated(officialName, corridor, urgencyLevel, emotionalTag);
    }
}
