// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureDisplacementAuditCodex {
    address public steward;

    struct DemolitionClause {
        string projectName;
        string affectedBarangay;
        string demolitionAction;
        string emotionalTag;
    }

    DemolitionClause[] public codex;

    event DisplacementTagged(string projectName, string affectedBarangay, string demolitionAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDisplacement(
        string memory projectName,
        string memory affectedBarangay,
        string memory demolitionAction,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(DemolitionClause(projectName, affectedBarangay, demolitionAction, emotionalTag));
        emit DisplacementTagged(projectName, affectedBarangay, demolitionAction, emotionalTag);
    }
}
