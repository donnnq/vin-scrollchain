// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EmbassyForexSanctum {
    address public originator;

    struct ForexScroll {
        string embassyTag;
        string currencySignal;
        string FATFStatus;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ForexScroll[] public forexLedger;

    constructor() {
        originator = msg.sender;
    }

    function logForexScroll(
        string memory embassyTag,
        string memory currencySignal,
        string memory FATFStatus,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        forexLedger.push(ForexScroll({
            embassyTag: embassyTag,
            currencySignal: currencySignal,
            FATFStatus: FATFStatus,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
