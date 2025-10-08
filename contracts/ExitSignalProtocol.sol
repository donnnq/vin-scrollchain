// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ExitSignalProtocol {
    address public originator;

    struct ExitScroll {
        string roleTag;
        string departureSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ExitScroll[] public exitLedger;

    constructor() {
        originator = msg.sender;
    }

    function logExitScroll(
        string memory roleTag,
        string memory departureSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        exitLedger.push(ExitScroll({
            roleTag: roleTag,
            departureSignal: departureSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
