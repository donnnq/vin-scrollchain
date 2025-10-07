// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract OutrageImmunityProtocol {
    address public originator;

    struct OutrageScroll {
        string mediaTag;
        string outrageSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    OutrageScroll[] public outrageLedger;

    constructor() {
        originator = msg.sender;
    }

    function logOutrageScroll(
        string memory mediaTag,
        string memory outrageSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        outrageLedger.push(OutrageScroll({
            mediaTag: mediaTag,
            outrageSignal: outrageSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
