// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract InfrastructureRedemptionManifest {
    address public originator;

    struct RedemptionScroll {
        string projectTag;
        string regionTag;
        string redemptionSignal;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    RedemptionScroll[] public redemptionLedger;

    constructor() {
        originator = msg.sender;
    }

    function logRedemptionScroll(
        string memory projectTag,
        string memory regionTag,
        string memory redemptionSignal,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        redemptionLedger.push(RedemptionScroll({
            projectTag: projectTag,
            regionTag: regionTag,
            redemptionSignal: redemptionSignal,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
