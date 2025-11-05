// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CombatMemoryHealingCodex {
    address public steward;

    struct HealingClause {
        string veteranName;
        string memoryFragment;
        string healingProtocol;
        string emotionalTag;
    }

    HealingClause[] public codex;

    event CombatMemoryHealed(string veteranName, string memoryFragment, string healingProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function healMemory(
        string memory veteranName,
        string memory memoryFragment,
        string memory healingProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(HealingClause(veteranName, memoryFragment, healingProtocol, emotionalTag));
        emit CombatMemoryHealed(veteranName, memoryFragment, healingProtocol, emotionalTag);
    }
}
