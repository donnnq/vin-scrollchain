// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyTo6GInfrastructureEthics {
    address public steward;

    struct EthicsClause {
        string infrastructureID;
        string corridor;
        string deploymentMethod;
        string ethicalTag;
    }

    EthicsClause[] public treatyLog;

    event InfrastructureEthicsTagged(string infrastructureID, string corridor, string deploymentMethod, string ethicalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagEthics(
        string memory infrastructureID,
        string memory corridor,
        string memory deploymentMethod,
        string memory ethicalTag
    ) public onlySteward {
        treatyLog.push(EthicsClause(infrastructureID, corridor, deploymentMethod, ethicalTag));
        emit InfrastructureEthicsTagged(infrastructureID, corridor, deploymentMethod, ethicalTag);
    }
}
