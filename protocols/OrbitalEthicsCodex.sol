// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrbitalEthicsCodex {
    address public steward;

    struct EthicsClause {
        string satelliteID;
        string corridor;
        string violationType;
        string ethicalTag;
    }

    EthicsClause[] public codex;

    event EthicsClauseLogged(string satelliteID, string corridor, string violationType, string ethicalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logClause(
        string memory satelliteID,
        string memory corridor,
        string memory violationType,
        string memory ethicalTag
    ) public onlySteward {
        codex.push(EthicsClause(satelliteID, corridor, violationType, ethicalTag));
        emit EthicsClauseLogged(satelliteID, corridor, violationType, ethicalTag);
    }
}
