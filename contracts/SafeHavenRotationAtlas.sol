// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SafeHavenRotationAtlas {
    address public originator;

    struct RotationScroll {
        string assetTag;
        uint256 priceChange;
        string rotationSignal;
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
        uint256 priceChange,
        string memory rotationSignal,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        rotationLedger.push(RotationScroll({
            assetTag: assetTag,
            priceChange: priceChange,
            rotationSignal: rotationSignal,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
