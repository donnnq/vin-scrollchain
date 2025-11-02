// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PrivacyCoinEthicsCodex {
    address public steward;

    struct EthicsClause {
        string coinName;
        string corridor;
        string ethicalConcern;
        string emotionalTag;
    }

    EthicsClause[] public codex;

    event EthicsTagged(string coinName, string corridor, string ethicalConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagEthics(
        string memory coinName,
        string memory corridor,
        string memory ethicalConcern,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EthicsClause(coinName, corridor, ethicalConcern, emotionalTag));
        emit EthicsTagged(coinName, corridor, ethicalConcern, emotionalTag);
    }
}
