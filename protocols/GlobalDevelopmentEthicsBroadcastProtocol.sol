// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalDevelopmentEthicsBroadcastProtocol {
    address public steward;

    struct EthicsClause {
        string developmentProject;
        string ethicalConcern;
        string broadcastProtocol;
        string emotionalTag;
    }

    EthicsClause[] public registry;

    event DevelopmentEthicsBroadcasted(string developmentProject, string ethicalConcern, string broadcastProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastEthics(
        string memory developmentProject,
        string memory ethicalConcern,
        string memory broadcastProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EthicsClause(developmentProject, ethicalConcern, broadcastProtocol, emotionalTag));
        emit DevelopmentEthicsBroadcasted(developmentProject, ethicalConcern, broadcastProtocol, emotionalTag);
    }
}
