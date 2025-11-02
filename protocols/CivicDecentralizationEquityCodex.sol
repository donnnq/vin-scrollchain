// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicDecentralizationEquityCodex {
    address public steward;

    struct DecentralizationClause {
        string newDistrict;
        string equityPurpose;
        string infrastructureType;
        string emotionalTag;
    }

    DecentralizationClause[] public codex;

    event DistrictLogged(string newDistrict, string equityPurpose, string infrastructureType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logDistrict(
        string memory newDistrict,
        string memory equityPurpose,
        string memory infrastructureType,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(DecentralizationClause(newDistrict, equityPurpose, infrastructureType, emotionalTag));
        emit DistrictLogged(newDistrict, equityPurpose, infrastructureType, emotionalTag);
    }
}
