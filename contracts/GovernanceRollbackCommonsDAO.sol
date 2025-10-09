// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GovernanceRollbackCommonsDAO {
    address public originator;

    struct RollbackScroll {
        string governanceTag;
        string rollbackSignal;
        string commonsAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    RollbackScroll[] public rollbackLedger;

    constructor() {
        originator = msg.sender;
    }

    function logRollbackScroll(
        string memory governanceTag,
        string memory rollbackSignal,
        string memory commonsAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        rollbackLedger.push(RollbackScroll({
            governanceTag: governanceTag,
            rollbackSignal: rollbackSignal,
            commonsAction: commonsAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
