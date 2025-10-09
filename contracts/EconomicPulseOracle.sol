// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EconomicPulseOracle {
    address public originator;

    struct PulseScroll {
        string regionTag;
        string forecastSignal;
        string oracleAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    PulseScroll[] public pulseLedger;

    constructor() {
        originator = msg.sender;
    }

    function logPulseScroll(
        string memory regionTag,
        string memory forecastSignal,
        string memory oracleAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        pulseLedger.push(PulseScroll({
            regionTag: regionTag,
            forecastSignal: forecastSignal,
            oracleAction: oracleAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
