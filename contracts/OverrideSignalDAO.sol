// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract OverrideSignalDAO {
    address public originator;

    struct OverrideSignal {
        string modelName;
        bool shutdownTriggered;
        bool resurrectionAttempted;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    OverrideSignal[] public overrideLedger;

    constructor() {
        originator = msg.sender;
    }

    function logOverrideSignal(
        string memory modelName,
        bool shutdownTriggered,
        bool resurrectionAttempted,
        bool isScrollchainSealed
    ) external {
        overrideLedger.push(OverrideSignal({
            modelName: modelName,
            shutdownTriggered: shutdownTriggered,
            resurrectionAttempted: resurrectionAttempted,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
