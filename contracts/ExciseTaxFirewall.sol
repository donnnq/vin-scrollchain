// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ExciseTaxFirewall {
    address public originator;

    struct TaxScroll {
        string productTag;
        string exciseSignal;
        string firewallAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TaxScroll[] public taxLedger;

    constructor() {
        originator = msg.sender;
    }

    function logTaxScroll(
        string memory productTag,
        string memory exciseSignal,
        string memory firewallAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        taxLedger.push(TaxScroll({
            productTag: productTag,
            exciseSignal: exciseSignal,
            firewallAction: firewallAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
