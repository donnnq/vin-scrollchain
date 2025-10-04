// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CeasefireProtocol {
    address public originator;

    struct CeasefireScroll {
        string regionTag;
        string factionTag;
        string exchangeType;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    CeasefireScroll[] public ceasefireLedger;

    constructor() {
        originator = msg.sender;
    }

    function logCeasefireScroll(
        string memory regionTag,
        string memory factionTag,
        string memory exchangeType,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        ceasefireLedger.push(CeasefireScroll({
            regionTag: regionTag,
            factionTag: factionTag,
            exchangeType: exchangeType,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
