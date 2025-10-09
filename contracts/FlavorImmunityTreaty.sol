// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FlavorImmunityTreaty {
    address public originator;

    struct ImmunityScroll {
        string flavorTag;
        string exportSignal;
        string treatyAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ImmunityScroll[] public immunityLedger;

    constructor() {
        originator = msg.sender;
    }

    function logImmunityScroll(
        string memory flavorTag,
        string memory exportSignal,
        string memory treatyAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        immunityLedger.push(ImmunityScroll({
            flavorTag: flavorTag,
            exportSignal: exportSignal,
            treatyAction: treatyAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
