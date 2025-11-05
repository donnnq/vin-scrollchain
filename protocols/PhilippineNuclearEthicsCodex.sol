// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PhilippineNuclearEthicsCodex {
    address public steward;

    struct EthicsClause {
        string reactorType;
        string ethicalSignal;
        string containmentProtocol;
        string emotionalTag;
    }

    EthicsClause[] public codex;

    event NuclearEthicsTagged(string reactorType, string ethicalSignal, string containmentProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEthics(
        string memory reactorType,
        string memory ethicalSignal,
        string memory containmentProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EthicsClause(reactorType, ethicalSignal, containmentProtocol, emotionalTag));
        emit NuclearEthicsTagged(reactorType, ethicalSignal, containmentProtocol, emotionalTag);
    }
}
