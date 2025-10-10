// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GhostReblockingDetectorDAO {
    address public originator;

    struct ReblockingSignal {
        string locationTag;
        string signalType;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ReblockingSignal[] public signalLedger;

    constructor() {
        originator = msg.sender;
    }

    function logReblockingSignal(
        string memory locationTag,
        string memory signalType,
        bool isScrollchainSealed
    ) external {
        signalLedger.push(ReblockingSignal({
            locationTag: locationTag,
            signalType: signalType,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
