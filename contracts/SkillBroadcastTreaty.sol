// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SkillBroadcastTreaty {
    address public originator;

    struct BroadcastScroll {
        string skillTag;
        string broadcastSignal;
        string treatyAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    BroadcastScroll[] public broadcastLedger;

    constructor() {
        originator = msg.sender;
    }

    function logBroadcastScroll(
        string memory skillTag,
        string memory broadcastSignal,
        string memory treatyAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        broadcastLedger.push(BroadcastScroll({
            skillTag: skillTag,
            broadcastSignal: broadcastSignal,
            treatyAction: treatyAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
