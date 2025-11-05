// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract QuantumBattlefieldImmunityCodex {
    address public steward;

    struct ImmunityClause {
        string quantumSystem;
        string battlefieldDomain;
        string immunitySignal;
        string emotionalTag;
    }

    ImmunityClause[] public codex;

    event QuantumBattlefieldImmunityTagged(string quantumSystem, string battlefieldDomain, string immunitySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory quantumSystem,
        string memory battlefieldDomain,
        string memory immunitySignal,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ImmunityClause(quantumSystem, battlefieldDomain, immunitySignal, emotionalTag));
        emit QuantumBattlefieldImmunityTagged(quantumSystem, battlefieldDomain, immunitySignal, emotionalTag);
    }
}
