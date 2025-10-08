// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CannabisTaxAuditProtocol {
    address public originator;

    struct TaxScroll {
        string stateTag;
        string taxSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TaxScroll[] public taxLedger;

    constructor() {
        originator = msg.sender;
    }

    function logTaxScroll(
        string memory stateTag,
        string memory taxSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        taxLedger.push(TaxScroll({
            stateTag: stateTag,
            taxSignal: taxSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
