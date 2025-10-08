// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LegacyCurationProtocol {
    address public originator;

    struct LegacyScroll {
        string artifactTag;
        string curationSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    LegacyScroll[] public legacyLedger;

    constructor() {
        originator = msg.sender;
    }

    function logLegacyScroll(
        string memory artifactTag,
        string memory curationSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        legacyLedger.push(LegacyScroll({
            artifactTag: artifactTag,
            curationSignal: curationSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
