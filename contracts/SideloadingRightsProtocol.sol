// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SideloadingRightsProtocol {
    address public originator;

    struct SideloadScroll {
        string deviceTag;
        string restrictionSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SideloadScroll[] public sideloadLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSideloadScroll(
        string memory deviceTag,
        string memory restrictionSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        sideloadLedger.push(SideloadScroll({
            deviceTag: deviceTag,
            restrictionSignal: restrictionSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
