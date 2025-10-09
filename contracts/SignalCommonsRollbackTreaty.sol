// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SignalCommonsRollbackTreaty {
    address public originator;

    struct RollbackScroll {
        string signalTag;
        string commonsTag;
        string rollbackAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    RollbackScroll[] public rollbackLedger;

    constructor() {
        originator = msg.sender;
    }

    function logRollbackScroll(
        string memory signalTag,
        string memory commonsTag,
        string memory rollbackAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        rollbackLedger.push(RollbackScroll({
            signalTag: signalTag,
            commonsTag: commonsTag,
            rollbackAction: rollbackAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
