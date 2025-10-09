// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DerivativesLiquidationProtocol {
    address public originator;

    struct LiquidationScroll {
        string assetTag;
        uint256 openInterestDrop;
        uint256 fundingRateDrop;
        string liquidationSignal;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    LiquidationScroll[] public liquidationLedger;

    constructor() {
        originator = msg.sender;
    }

    function logLiquidationScroll(
        string memory assetTag,
        uint256 openInterestDrop,
        uint256 fundingRateDrop,
        string memory liquidationSignal,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        liquidationLedger.push(LiquidationScroll({
            assetTag: assetTag,
            openInterestDrop: openInterestDrop,
            fundingRateDrop: fundingRateDrop,
            liquidationSignal: liquidationSignal,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
