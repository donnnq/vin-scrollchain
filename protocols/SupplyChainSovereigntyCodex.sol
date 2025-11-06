// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChainSovereigntyCodex {
    address public steward;

    struct SovereigntyClause {
        string sector;
        string dependencyRisk;
        string sovereigntyProtocol;
        string emotionalTag;
    }

    SovereigntyClause[] public codex;

    event SupplyChainSovereigntyTagged(string sector, string dependencyRisk, string sovereigntyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSovereignty(
        string memory sector,
        string memory dependencyRisk,
        string memory sovereigntyProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SovereigntyClause(sector, dependencyRisk, sovereigntyProtocol, emotionalTag));
        emit SupplyChainSovereigntyTagged(sector, dependencyRisk, sovereigntyProtocol, emotionalTag);
    }
}
