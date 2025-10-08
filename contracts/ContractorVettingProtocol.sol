// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ContractorVettingProtocol {
    address public originator;

    struct VettingScroll {
        string contractorTag;
        string vettingSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    VettingScroll[] public vettingLedger;

    constructor() {
        originator = msg.sender;
    }

    function logVettingScroll(
        string memory contractorTag,
        string memory vettingSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        vettingLedger.push(VettingScroll({
            contractorTag: contractorTag,
            vettingSignal: vettingSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
