// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryDefenseEthicsCodex {
    address public steward;

    struct EthicsClause {
        string defenseSystem;
        string ethicalSignal;
        string codexMechanism;
        string emotionalTag;
    }

    EthicsClause[] public codex;

    event PlanetaryDefenseEthicsTagged(string defenseSystem, string ethicalSignal, string codexMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEthics(
        string memory defenseSystem,
        string memory ethicalSignal,
        string memory codexMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EthicsClause(defenseSystem, ethicalSignal, codexMechanism, emotionalTag));
        emit PlanetaryDefenseEthicsTagged(defenseSystem, ethicalSignal, codexMechanism, emotionalTag);
    }
}
