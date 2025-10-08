// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FestivalLightProtocol {
    address public originator;

    struct LightScroll {
        string eventTag;
        string illuminationSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    LightScroll[] public lightLedger;

    constructor() {
        originator = msg.sender;
    }

    function logLightScroll(
        string memory eventTag,
        string memory illuminationSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        lightLedger.push(LightScroll({
            eventTag: eventTag,
            illuminationSignal: illuminationSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
