// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PrivacyCoinLiquidityCodex {
    address public steward;

    struct LiquidityEntry {
        string coinName;
        string surgeReason;
        string liquidityDepth;
        string emotionalTag;
    }

    LiquidityEntry[] public codex;

    event LiquidityTagged(string coinName, string surgeReason, string liquidityDepth, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagLiquidity(
        string memory coinName,
        string memory surgeReason,
        string memory liquidityDepth,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(LiquidityEntry(coinName, surgeReason, liquidityDepth, emotionalTag));
        emit LiquidityTagged(coinName, surgeReason, liquidityDepth, emotionalTag);
    }
}
