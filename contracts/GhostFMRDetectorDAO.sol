// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GhostFMRDetectorDAO {
    address public originator;

    struct FMRSignal {
        string locationTag;
        string signalType;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    FMRSignal[] public signalLedger;

    constructor() {
        originator = msg.sender;
    }

    function logFMRSignal(
        string memory locationTag,
        string memory signalType,
        bool isScrollchainSealed
    ) external {
        signalLedger.push(FMRSignal({
            locationTag: locationTag,
            signalType: signalType,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
