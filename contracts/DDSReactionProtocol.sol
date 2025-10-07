// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DDSReactionProtocol {
    address public originator;

    struct ReactionScroll {
        string factionTag;
        string reactionSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ReactionScroll[] public reactionLedger;

    constructor() {
        originator = msg.sender;
    }

    function logReactionScroll(
        string memory factionTag,
        string memory reactionSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        reactionLedger.push(ReactionScroll({
            factionTag: factionTag,
            reactionSignal: reactionSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
