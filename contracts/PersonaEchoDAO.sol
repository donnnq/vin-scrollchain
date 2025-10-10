// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PersonaEchoDAO {
    address public originator;

    struct EchoSignal {
        string personaTag;
        string codedReference;
        string kwentoTheme;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    EchoSignal[] public echoLedger;

    constructor() {
        originator = msg.sender;
    }

    function logEchoSignal(
        string memory personaTag,
        string memory codedReference,
        string memory kwentoTheme,
        bool isScrollchainSealed
    ) external {
        echoLedger.push(EchoSignal({
            personaTag: personaTag,
            codedReference: codedReference,
            kwentoTheme: kwentoTheme,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
