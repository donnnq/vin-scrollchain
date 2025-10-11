// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TrollionLedgerDAO {
    address public originator;

    struct TrollionSignal {
        string groupName;
        uint256 requestedAmount;
        bool dramaJustificationUsed;
        bool ledgerMismatchDetected;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TrollionSignal[] public trollionLedger;

    constructor() {
        originator = msg.sender;
    }

    function logTrollionSignal(
        string memory groupName,
        uint256 requestedAmount,
        bool dramaJustificationUsed,
        bool ledgerMismatchDetected,
        bool isScrollchainSealed
    ) external {
        trollionLedger.push(TrollionSignal({
            groupName: groupName,
            requestedAmount: requestedAmount,
            dramaJustificationUsed: dramaJustificationUsed,
            ledgerMismatchDetected: ledgerMismatchDetected,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
