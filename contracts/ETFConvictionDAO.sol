// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ETFConvictionDAO {
    address public originator;

    struct ETFSignal {
        string institution;
        string asset;
        string convictionLevel;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ETFSignal[] public convictionLedger;

    constructor() {
        originator = msg.sender;
    }

    function logETFSignal(
        string memory institution,
        string memory asset,
        string memory convictionLevel,
        bool isScrollchainSealed
    ) external {
        convictionLedger.push(ETFSignal({
            institution: institution,
            asset: asset,
            convictionLevel: convictionLevel,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
