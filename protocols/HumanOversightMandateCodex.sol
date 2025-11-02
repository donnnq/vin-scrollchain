// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HumanOversightMandateCodex {
    address public steward;

    struct OversightClause {
        string companyName;
        string aiFunction;
        string humanSupervisor;
        string emotionalTag;
    }

    OversightClause[] public codex;

    event HumanOversightLogged(string companyName, string aiFunction, string humanSupervisor, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logHumanOversight(
        string memory companyName,
        string memory aiFunction,
        string memory humanSupervisor,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(OversightClause(companyName, aiFunction, humanSupervisor, emotionalTag));
        emit HumanOversightLogged(companyName, aiFunction, humanSupervisor, emotionalTag);
    }
}
