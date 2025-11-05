// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TrainDeploymentTransparencyCodex {
    address public steward;

    struct DeploymentClause {
        string trainSetID;
        string deploymentStage;
        string transparencyProtocol;
        string emotionalTag;
    }

    DeploymentClause[] public codex;

    event TrainDeploymentTagged(string trainSetID, string deploymentStage, string transparencyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDeployment(
        string memory trainSetID,
        string memory deploymentStage,
        string memory transparencyProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(DeploymentClause(trainSetID, deploymentStage, transparencyProtocol, emotionalTag));
        emit TrainDeploymentTagged(trainSetID, deploymentStage, transparencyProtocol, emotionalTag);
    }
}
