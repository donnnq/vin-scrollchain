// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EspionageEthicsRegistryCodex {
    address public steward;

    struct EthicsClause {
        string actor;
        string intelFunction;
        string ethicalConcern;
        string emotionalTag;
    }

    EthicsClause[] public codex;

    event EthicsTagged(string actor, string intelFunction, string ethicalConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagEthics(
        string memory actor,
        string memory intelFunction,
        string memory ethicalConcern,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EthicsClause(actor, intelFunction, ethicalConcern, emotionalTag));
        emit EthicsTagged(actor, intelFunction, ethicalConcern, emotionalTag);
    }
}
