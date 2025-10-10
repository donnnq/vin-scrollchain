// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WorkModeChoiceDAO {
    address public originator;

    struct WorkModeScroll {
        address worker;
        string preferredMode; // "WFH", "WFO", or "Hybrid"
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    WorkModeScroll[] public workModeLedger;

    constructor() {
        originator = msg.sender;
    }

    function logWorkModeScroll(
        address worker,
        string memory preferredMode,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        workModeLedger.push(WorkModeScroll({
            worker: worker,
            preferredMode: preferredMode,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
