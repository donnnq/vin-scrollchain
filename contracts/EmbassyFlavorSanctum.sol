// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EmbassyFlavorSanctum {
    address public originator;

    struct SanctumScroll {
        string embassyTag;
        string snackSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SanctumScroll[] public flavorSanctumLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSanctumScroll(
        string memory embassyTag,
        string memory snackSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        flavorSanctumLedger.push(SanctumScroll({
            embassyTag: embassyTag,
            snackSignal: snackSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
