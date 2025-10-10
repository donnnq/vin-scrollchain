// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WorkerAutonomyLedgerDAO {
    address public originator;

    struct AutonomyScroll {
        address worker;
        string chosenMode; // "WFH", "WFO", or "Hybrid"
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    AutonomyScroll[] public autonomyLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAutonomyScroll(
        address worker,
        string memory chosenMode,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        autonomyLedger.push(AutonomyScroll({
            worker: worker,
            chosenMode: chosenMode,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
