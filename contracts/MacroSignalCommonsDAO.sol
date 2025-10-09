// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MacroSignalCommonsDAO {
    address public originator;

    struct SignalScroll {
        string signalTag;
        string assetClass;
        string macroImpact;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SignalScroll[] public signalLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSignalScroll(
        string memory signalTag,
        string memory assetClass,
        string memory macroImpact,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        signalLedger.push(SignalScroll({
            signalTag: signalTag,
            assetClass: assetClass,
            macroImpact: macroImpact,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
