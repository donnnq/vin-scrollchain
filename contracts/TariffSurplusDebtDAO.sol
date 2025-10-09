// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TariffSurplusDebtDAO {
    address public originator;

    struct SurplusScroll {
        uint256 surplusAmount;
        string allocationSignal;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SurplusScroll[] public surplusLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSurplusScroll(
        uint256 surplusAmount,
        string memory allocationSignal,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        surplusLedger.push(SurplusScroll({
            surplusAmount: surplusAmount,
            allocationSignal: allocationSignal,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
