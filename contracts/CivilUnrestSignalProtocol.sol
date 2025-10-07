// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CivilUnrestSignalProtocol {
    address public originator;

    struct UnrestScroll {
        string cityTag;
        string unrestSignal;
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
        string memory cityTag,
        string memory unrestSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        unrestLedger.push(UnrestScroll({
            cityTag: cityTag,
            unrestSignal: unrestSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
