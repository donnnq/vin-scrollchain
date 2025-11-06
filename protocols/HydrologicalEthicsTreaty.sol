// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HydrologicalEthicsTreaty {
    address public steward;

    struct EthicsClause {
        string projectName;
        string terrainType;
        string waterFlowImpact;
        string ethicalProtocol;
        string emotionalTag;
    }

    EthicsClause[] public treatyLog;

    event HydrologicalEthicsTagged(string projectName, string terrainType, string waterFlowImpact, string ethicalProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEthics(
        string memory projectName,
        string memory terrainType,
        string memory waterFlowImpact,
        string memory ethicalProtocol,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(EthicsClause(projectName, terrainType, waterFlowImpact, ethicalProtocol, emotionalTag));
        emit HydrologicalEthicsTagged(projectName, terrainType, waterFlowImpact, ethicalProtocol, emotionalTag);
    }
}
