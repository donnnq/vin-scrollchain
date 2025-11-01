// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIRANSovereigntyCodex {
    address public steward;

    struct AIRANClause {
        string provider;
        string corridor;
        string optimizationMethod;
        string ethicalTag;
    }

    AIRANClause[] public codex;

    event AIRANCodified(string provider, string corridor, string optimizationMethod, string ethicalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function codifyAIRAN(
        string memory provider,
        string memory corridor,
        string memory optimizationMethod,
        string memory ethicalTag
    ) public onlySteward {
        codex.push(AIRANClause(provider, corridor, optimizationMethod, ethicalTag));
        emit AIRANCodified(provider, corridor, optimizationMethod, ethicalTag);
    }
}
