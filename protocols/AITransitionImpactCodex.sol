// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AITransitionImpactCodex {
    address public steward;

    struct AIImpactEntry {
        string companyName;
        string replacedRole;
        string AISystemUsed;
        string emotionalTag;
    }

    AIImpactEntry[] public codex;

    event AIImpactLogged(string companyName, string replacedRole, string AISystemUsed, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logAIImpact(
        string memory companyName,
        string memory replacedRole,
        string memory AISystemUsed,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(AIImpactEntry(companyName, replacedRole, AISystemUsed, emotionalTag));
        emit AIImpactLogged(companyName, replacedRole, AISystemUsed, emotionalTag);
    }
}
