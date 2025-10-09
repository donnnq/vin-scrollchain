// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CampusNourishmentProtocol {
    address public originator;

    struct NourishmentScroll {
        string schoolTag;
        string feedingSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    NourishmentScroll[] public nourishmentLedger;

    constructor() {
        originator = msg.sender;
    }

    function logNourishmentScroll(
        string memory schoolTag,
        string memory feedingSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        nourishmentLedger.push(NourishmentScroll({
            schoolTag: schoolTag,
            feedingSignal: feedingSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
