// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkingClassDefinitionCodex {
    address public steward;

    struct DefinitionClause {
        string region;
        string incomeThreshold;
        string definitionProtocol;
        string emotionalTag;
    }

    DefinitionClause[] public codex;

    event WorkingClassDefinitionTagged(string region, string incomeThreshold, string definitionProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDefinition(
        string memory region,
        string memory incomeThreshold,
        string memory definitionProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(DefinitionClause(region, incomeThreshold, definitionProtocol, emotionalTag));
        emit WorkingClassDefinitionTagged(region, incomeThreshold, definitionProtocol, emotionalTag);
    }
}
