// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract InfrastructureTruthProtocol {
    address public originator;

    struct TruthScroll {
        string witnessTag;
        string projectTag;
        string truthSignal;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TruthScroll[] public truthLedger;

    constructor() {
        originator = msg.sender;
    }

    function logTruthScroll(
        string memory witnessTag,
        string memory projectTag,
        string memory truthSignal,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        truthLedger.push(TruthScroll({
            witnessTag: witnessTag,
            projectTag: projectTag,
            truthSignal: truthSignal,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
