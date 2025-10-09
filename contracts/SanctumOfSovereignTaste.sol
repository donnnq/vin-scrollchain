// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SanctumOfSovereignTaste {
    address public originator;

    struct TasteScroll {
        string flavorTag;
        string sovereigntySignal;
        string sanctumAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TasteScroll[] public tasteLedger;

    constructor() {
        originator = msg.sender;
    }

    function logTasteScroll(
        string memory flavorTag,
        string memory sovereigntySignal,
        string memory sanctumAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        tasteLedger.push(TasteScroll({
            flavorTag: flavorTag,
            sovereigntySignal: sovereigntySignal,
            sanctumAction: sanctumAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
