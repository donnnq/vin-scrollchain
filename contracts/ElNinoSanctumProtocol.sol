// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ElNinoSanctumProtocol {
    address public originator;

    struct ElNinoScroll {
        string regionTag;
        string droughtSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ElNinoScroll[] public elNinoLedger;

    constructor() {
        originator = msg.sender;
    }

    function logElNinoScroll(
        string memory regionTag,
        string memory droughtSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        elNinoLedger.push(ElNinoScroll({
            regionTag: regionTag,
            droughtSignal: droughtSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
