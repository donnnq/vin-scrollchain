// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract NatureCapitalProtocol {
    address public originator;

    struct NatureScroll {
        string regionTag;
        string assetSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    NatureScroll[] public natureLedger;

    constructor() {
        originator = msg.sender;
    }

    function logNatureScroll(
        string memory regionTag,
        string memory assetSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        natureLedger.push(NatureScroll({
            regionTag: regionTag,
            assetSignal: assetSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
