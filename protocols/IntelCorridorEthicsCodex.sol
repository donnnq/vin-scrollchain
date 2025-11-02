// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntelCorridorEthicsCodex {
    address public steward;

    struct EthicsClause {
        string corridor;
        string intelFunction;
        string ethicalConcern;
        string emotionalTag;
    }

    EthicsClause[] public codex;

    event EthicsTagged(string corridor, string intelFunction, string ethicalConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagEthics(
        string memory corridor,
        string memory intelFunction,
        string memory ethicalConcern,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EthicsClause(corridor, intelFunction, ethicalConcern, emotionalTag));
        emit EthicsTagged(corridor, intelFunction, ethicalConcern, emotionalTag);
    }
}
