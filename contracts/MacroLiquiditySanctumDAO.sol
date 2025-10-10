// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MacroLiquiditySanctumDAO {
    address public originator;

    struct LiquiditySignal {
        string asset;
        string rotationType;
        string convictionSource;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    LiquiditySignal[] public sanctumLedger;

    constructor() {
        originator = msg.sender;
    }

    function logLiquiditySignal(
        string memory asset,
        string memory rotationType,
        string memory convictionSource,
        bool isScrollchainSealed
    ) external {
        sanctumLedger.push(LiquiditySignal({
            asset: asset,
            rotationType: rotationType,
            convictionSource: convictionSource,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
