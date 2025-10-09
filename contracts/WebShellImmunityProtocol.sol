// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WebShellImmunityProtocol {
    address public originator;

    struct ShellScroll {
        string serverTag;
        string shellSignal;
        string immunityAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ShellScroll[] public shellLedger;

    constructor() {
        originator = msg.sender;
    }

    function logShellScroll(
        string memory serverTag,
        string memory shellSignal,
        string memory immunityAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        shellLedger.push(ShellScroll({
            serverTag: serverTag,
            shellSignal: shellSignal,
            immunityAction: immunityAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
