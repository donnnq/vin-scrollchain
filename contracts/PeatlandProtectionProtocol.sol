// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PeatlandProtectionProtocol {
    address public originator;

    struct PeatScroll {
        string regionTag;
        string carbonSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    PeatScroll[] public peatLedger;

    constructor() {
        originator = msg.sender;
    }

    function logPeatScroll(
        string memory regionTag,
        string memory carbonSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        peatLedger.push(PeatScroll({
            regionTag: regionTag,
            carbonSignal: carbonSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
