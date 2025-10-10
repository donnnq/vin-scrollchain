// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DebtTrapDetectorDAO {
    address public originator;

    struct TrapSignal {
        string countryTag;
        string corridorName;
        string signalType;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TrapSignal[] public trapLedger;

    constructor() {
        originator = msg.sender;
    }

    function logTrapSignal(
        string memory countryTag,
        string memory corridorName,
        string memory signalType,
        bool isScrollchainSealed
    ) external {
        trapLedger.push(TrapSignal({
            countryTag: countryTag,
            corridorName: corridorName,
            signalType: signalType,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
