// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HempContainmentProtocol {
    address public originator;

    struct ContainmentScroll {
        string compoundTag;
        string retailChannel;
        string enforcementSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ContainmentScroll[] public hempLedger;

    constructor() {
        originator = msg.sender;
    }

    function logContainmentScroll(
        string memory compoundTag,
        string memory retailChannel,
        string memory enforcementSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        hempLedger.push(ContainmentScroll({
            compoundTag: compoundTag,
            retailChannel: retailChannel,
            enforcementSignal: enforcementSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
