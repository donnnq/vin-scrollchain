// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicInfrastructureEthicsTreaty {
    address public steward;

    struct EthicsClause {
        string projectName;
        string corridor;
        string ethicalConcern;
        string emotionalTag;
    }

    EthicsClause[] public treatyLog;

    event InfrastructureEthicsTagged(string projectName, string corridor, string ethicalConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagEthics(
        string memory projectName,
        string memory corridor,
        string memory ethicalConcern,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(EthicsClause(projectName, corridor, ethicalConcern, emotionalTag));
        emit InfrastructureEthicsTagged(projectName, corridor, ethicalConcern, emotionalTag);
    }
}
