// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ETFFlowDAO {
    address public originator;

    struct ETFSignal {
        string assetType;
        string flowDirection;
        string inflowMagnitude;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ETFSignal[] public flowLedger;

    constructor() {
        originator = msg.sender;
    }

    function logETFSignal(
        string memory assetType,
        string memory flowDirection,
        string memory inflowMagnitude,
        bool isScrollchainSealed
    ) external {
        flowLedger.push(ETFSignal({
            assetType: assetType,
            flowDirection: flowDirection,
            inflowMagnitude: inflowMagnitude,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
