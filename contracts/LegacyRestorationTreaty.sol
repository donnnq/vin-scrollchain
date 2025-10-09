// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LegacyRestorationTreaty {
    address public originator;

    struct LegacyScroll {
        string projectTag;
        string regionTag;
        string restorationSignal;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    LegacyScroll[] public legacyLedger;

    constructor() {
        originator = msg.sender;
    }

    function logLegacyScroll(
        string memory projectTag,
        string memory regionTag,
        string memory restorationSignal,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        legacyLedger.push(LegacyScroll({
            projectTag: projectTag,
            regionTag: regionTag,
            restorationSignal: restorationSignal,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
