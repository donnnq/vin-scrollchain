// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract InfrastructureCollapseRegistry {
    address public originator;

    struct CollapseScroll {
        string systemTag;
        string stressSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    CollapseScroll[] public collapseLedger;

    constructor() {
        originator = msg.sender;
    }

    function logCollapseScroll(
        string memory systemTag,
        string memory stressSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        collapseLedger.push(CollapseScroll({
            systemTag: systemTag,
            stressSignal: stressSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
