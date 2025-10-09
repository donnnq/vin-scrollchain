// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CraftDistilleryDAO {
    address public originator;

    struct DistilleryScroll {
        string distilleryTag;
        string craftSignal;
        string governanceAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    DistilleryScroll[] public distilleryLedger;

    constructor() {
        originator = msg.sender;
    }

    function logDistilleryScroll(
        string memory distilleryTag,
        string memory craftSignal,
        string memory governanceAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        distilleryLedger.push(DistilleryScroll({
            distilleryTag: distilleryTag,
            craftSignal: craftSignal,
            governanceAction: governanceAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
