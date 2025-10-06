// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DepositIntentProtocol {
    address public originator;

    struct IntentScroll {
        string vaultTag;
        string intentSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    IntentScroll[] public intentLedger;

    constructor() {
        originator = msg.sender;
    }

    function logIntentScroll(
        string memory vaultTag,
        string memory intentSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        intentLedger.push(IntentScroll({
            vaultTag: vaultTag,
            intentSignal: intentSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
