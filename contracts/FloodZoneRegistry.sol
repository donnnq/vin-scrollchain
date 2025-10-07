// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FloodZoneRegistry {
    address public originator;

    struct ZoneScroll {
        string locationTag;
        string mappingSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ZoneScroll[] public zoneLedger;

    constructor() {
        originator = msg.sender;
    }

    function logZoneScroll(
        string memory locationTag,
        string memory mappingSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        zoneLedger.push(ZoneScroll({
            locationTag: locationTag,
            mappingSignal: mappingSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
