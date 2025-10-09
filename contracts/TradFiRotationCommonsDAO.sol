// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TradFiRotationCommonsDAO {
    address public originator;

    struct RotationScroll {
        string assetTag;
        string rotationSignal;
        uint256 flowAmount;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    RotationScroll[] public rotationLedger;

    constructor() {
        originator = msg.sender;
    }

    function logRotationScroll(
        string memory assetTag,
        string memory rotationSignal,
        uint256 flowAmount,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        rotationLedger.push(RotationScroll({
            assetTag: assetTag,
            rotationSignal: rotationSignal,
            flowAmount: flowAmount,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
