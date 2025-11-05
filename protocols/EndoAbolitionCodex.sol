// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EndoAbolitionCodex {
    address public steward;

    struct ContractClause {
        string companyName;
        string contractCycle;
        string terminationPattern;
        string emotionalTag;
    }

    ContractClause[] public codex;

    event EndoTagged(string companyName, string contractCycle, string terminationPattern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEndo(
        string memory companyName,
        string memory contractCycle,
        string memory terminationPattern,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ContractClause(companyName, contractCycle, terminationPattern, emotionalTag));
        emit EndoTagged(companyName, contractCycle, terminationPattern, emotionalTag);
    }
}
