// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContainmentEthicsCodex {
    address public steward;

    struct EthicsClause {
        string corridor;
        string containmentAction;
        string ethicalConcern;
        string emotionalTag;
    }

    EthicsClause[] public codex;

    event EthicsTagged(string corridor, string containmentAction, string ethicalConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagEthics(
        string memory corridor,
        string memory containmentAction,
        string memory ethicalConcern,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EthicsClause(corridor, containmentAction, ethicalConcern, emotionalTag));
        emit EthicsTagged(corridor, containmentAction, ethicalConcern, emotionalTag);
    }
}
