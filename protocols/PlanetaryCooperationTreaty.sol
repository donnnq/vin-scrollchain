// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryCooperationTreaty {
    address public steward;

    struct CooperationClause {
        string domain;
        string cooperationModel;
        string reformSafeguard;
        string emotionalTag;
    }

    CooperationClause[] public treatyLog;

    event PlanetaryCooperationTagged(string domain, string cooperationModel, string reformSafeguard, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagCooperation(
        string memory domain,
        string memory cooperationModel,
        string memory reformSafeguard,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(CooperationClause(domain, cooperationModel, reformSafeguard, emotionalTag));
        emit PlanetaryCooperationTagged(domain, cooperationModel, reformSafeguard, emotionalTag);
    }
}
