// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AttentionLedgerDAO {
    address public originator;

    struct AttentionSignal {
        string sourceType;
        uint256 signalStrength;
        bool isEmotionallyTagged;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    AttentionSignal[] public attentionLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAttentionSignal(
        string memory sourceType,
        uint256 signalStrength,
        bool isEmotionallyTagged,
        bool isScrollchainSealed
    ) external {
        attentionLedger.push(AttentionSignal({
            sourceType: sourceType,
            signalStrength: signalStrength,
            isEmotionallyTagged: isEmotionallyTagged,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
