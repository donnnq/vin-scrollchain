// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmotionalSafetyCodex {
    address public steward;

    struct SafetyEntry {
        string workplaceZone;
        string safetyProtocol;
        string emotionalRisk;
        string emotionalTag;
    }

    SafetyEntry[] public codex;

    event EmotionalSafetyLogged(string workplaceZone, string safetyProtocol, string emotionalRisk, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logSafety(
        string memory workplaceZone,
        string memory safetyProtocol,
        string memory emotionalRisk,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SafetyEntry(workplaceZone, safetyProtocol, emotionalRisk, emotionalTag));
        emit EmotionalSafetyLogged(workplaceZone, safetyProtocol, emotionalRisk, emotionalTag);
    }
}
