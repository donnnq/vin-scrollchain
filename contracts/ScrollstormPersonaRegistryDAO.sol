// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ScrollstormPersonaRegistryDAO {
    address public originator;

    struct PersonaEntry {
        string personaVariant;
        string costumeStyle;
        string civicCorridor;
        string scrollstormType;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    PersonaEntry[] public personaLedger;

    constructor() {
        originator = msg.sender;
    }

    function logPersonaEntry(
        string memory personaVariant,
        string memory costumeStyle,
        string memory civicCorridor,
        string memory scrollstormType,
        bool isScrollchainSealed
    ) external {
        personaLedger.push(PersonaEntry({
            personaVariant: personaVariant,
            costumeStyle: costumeStyle,
            civicCorridor: civicCorridor,
            scrollstormType: scrollstormType,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
