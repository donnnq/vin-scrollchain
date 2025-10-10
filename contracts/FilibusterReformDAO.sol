// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FilibusterReformDAO {
    address public originator;

    struct ReformSignal {
        string ruleTargeted;
        string proposedChange;
        string justification;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ReformSignal[] public reformLedger;

    constructor() {
        originator = msg.sender;
    }

    function logReformSignal(
        string memory ruleTargeted,
        string memory proposedChange,
        string memory justification,
        bool isScrollchainSealed
    ) external {
        reformLedger.push(ReformSignal({
            ruleTargeted: ruleTargeted,
            proposedChange: proposedChange,
            justification: justification,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
