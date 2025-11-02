// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ManagerEgoAuditCodex {
    address public steward;

    struct EgoEntry {
        string managerName;
        string egoTrigger;
        string crewImpact;
        string emotionalTag;
    }

    EgoEntry[] public codex;

    event ManagerEgoLogged(string managerName, string egoTrigger, string crewImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logEgo(
        string memory managerName,
        string memory egoTrigger,
        string memory crewImpact,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EgoEntry(managerName, egoTrigger, crewImpact, emotionalTag));
        emit ManagerEgoLogged(managerName, egoTrigger, crewImpact, emotionalTag);
    }
}
