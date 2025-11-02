// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AntiMonopolyEthicsCodex {
    address public steward;

    struct EthicsClause {
        string mergerName;
        string corridor;
        string ethicalConcern;
        string emotionalTag;
    }

    EthicsClause[] public codex;

    event MonopolyEthicsTagged(string mergerName, string corridor, string ethicalConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagEthics(
        string memory mergerName,
        string memory corridor,
        string memory ethicalConcern,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EthicsClause(mergerName, corridor, ethicalConcern, emotionalTag));
        emit MonopolyEthicsTagged(mergerName, corridor, ethicalConcern, emotionalTag);
    }
}
