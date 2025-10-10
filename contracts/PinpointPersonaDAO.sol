// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PinpointPersonaDAO {
    address public originator;

    struct PersonaSignal {
        string personaName;
        string referenceStyle;
        string kwentoTheme;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    PersonaSignal[] public personaLedger;

    constructor() {
        originator = msg.sender;
    }

    function logPersonaSignal(
        string memory personaName,
        string memory referenceStyle,
        string memory kwentoTheme,
        bool isScrollchainSealed
    ) external {
        personaLedger.push(PersonaSignal({
            personaName: personaName,
            referenceStyle: referenceStyle,
            kwentoTheme: kwentoTheme,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
