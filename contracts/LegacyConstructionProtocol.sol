// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LegacyConstructionProtocol {
    address public originator;

    struct BuildScroll {
        string corridorTag;
        string buildSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    BuildScroll[] public buildLedger;

    constructor() {
        originator = msg.sender;
    }

    function logBuildScroll(
        string memory corridorTag,
        string memory buildSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        buildLedger.push(BuildScroll({
            corridorTag: corridorTag,
            buildSignal: buildSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
