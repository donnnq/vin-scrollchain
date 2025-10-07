// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WorkerBurnoutSignalProtocol {
    address public originator;

    struct BurnoutScroll {
        string workerTag;
        string burnoutSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    BurnoutScroll[] public burnoutLedger;

    constructor() {
        originator = msg.sender;
    }

    function logBurnoutScroll(
        string memory workerTag,
        string memory burnoutSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        burnoutLedger.push(BurnoutScroll({
            workerTag: workerTag,
            burnoutSignal: burnoutSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
