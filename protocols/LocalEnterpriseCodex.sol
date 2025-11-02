// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LocalEnterpriseCodex {
    address public steward;

    struct EnterpriseClause {
        string enterpriseName;
        string barangay;
        string sector;
        string emotionalTag;
    }

    EnterpriseClause[] public codex;

    event EnterpriseLogged(string enterpriseName, string barangay, string sector, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logEnterprise(
        string memory enterpriseName,
        string memory barangay,
        string memory sector,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EnterpriseClause(enterpriseName, barangay, sector, emotionalTag));
        emit EnterpriseLogged(enterpriseName, barangay, sector, emotionalTag);
    }
}
