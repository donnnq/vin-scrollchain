// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RollbackImmunityCommonsDAO {
    address public originator;

    struct ImmunityScroll {
        string versionTag;
        string rollbackSignal;
        string commonsAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ImmunityScroll[] public immunityLedger;

    constructor() {
        originator = msg.sender;
    }

    function logImmunityScroll(
        string memory versionTag,
        string memory rollbackSignal,
        string memory commonsAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        immunityLedger.push(ImmunityScroll({
            versionTag: versionTag,
            rollbackSignal: rollbackSignal,
            commonsAction: commonsAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
