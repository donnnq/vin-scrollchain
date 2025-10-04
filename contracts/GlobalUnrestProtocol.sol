// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GlobalUnrestProtocol {
    address public originator;

    struct UnrestScroll {
        string locationTag;
        string ritualType;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    UnrestScroll[] public unrestLedger;

    constructor() {
        originator = msg.sender;
    }

    function logUnrestScroll(
        string memory locationTag,
        string memory ritualType,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        unrestLedger.push(UnrestScroll({
            locationTag: locationTag,
            ritualType: ritualType,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
