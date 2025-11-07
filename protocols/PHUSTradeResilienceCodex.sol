// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PHUSTradeResilienceCodex {
    address public steward;

    struct ResilienceEntry {
        string tradeSector;
        string resilienceStrategy;
        string bilateralImpact;
        string emotionalTag;
    }

    ResilienceEntry[] public codex;

    event TradeResilienceTagged(string tradeSector, string resilienceStrategy, string bilateralImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory tradeSector,
        string memory resilienceStrategy,
        string memory bilateralImpact,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ResilienceEntry(tradeSector, resilienceStrategy, bilateralImpact, emotionalTag));
        emit TradeResilienceTagged(tradeSector, resilienceStrategy, bilateralImpact, emotionalTag);
    }
}
