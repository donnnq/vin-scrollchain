// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SanctumHarvestProtocol {
    address public originator;

    struct HarvestScroll {
        string nourishmentTag;
        string harvestSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    HarvestScroll[] public harvestLedger;

    constructor() {
        originator = msg.sender;
    }

    function logHarvestScroll(
        string memory nourishmentTag,
        string memory harvestSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        harvestLedger.push(HarvestScroll({
            nourishmentTag: nourishmentTag,
            harvestSignal: harvestSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
