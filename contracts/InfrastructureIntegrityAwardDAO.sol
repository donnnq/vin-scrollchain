// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract InfrastructureIntegrityAwardDAO {
    address public originator;

    struct AwardScroll {
        string recipientTag;
        string projectTag;
        string awardSignal;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    AwardScroll[] public awardLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAwardScroll(
        string memory recipientTag,
        string memory projectTag,
        string memory awardSignal,
        bool isScrollchainSealed
    ) external {
        awardLedger.push(AwardScroll({
            recipientTag: recipientTag,
            projectTag: projectTag,
            awardSignal: awardSignal,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
