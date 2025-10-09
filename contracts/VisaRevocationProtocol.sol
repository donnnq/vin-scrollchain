// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract VisaRevocationProtocol {
    address public originator;

    struct RevocationScroll {
        string nameTag;
        string watchlistSignal;
        string agencyTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    RevocationScroll[] public revocationLedger;

    constructor() {
        originator = msg.sender;
    }

    function logRevocationScroll(
        string memory nameTag,
        string memory watchlistSignal,
        string memory agencyTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        revocationLedger.push(RevocationScroll({
            nameTag: nameTag,
            watchlistSignal: watchlistSignal,
            agencyTag: agencyTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
