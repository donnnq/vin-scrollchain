// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MedicalResearchProtocol {
    address public originator;

    struct ResearchScroll {
        string compoundTag;
        string researchSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ResearchScroll[] public researchLedger;

    constructor() {
        originator = msg.sender;
    }

    function logResearchScroll(
        string memory compoundTag,
        string memory researchSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        researchLedger.push(ResearchScroll({
            compoundTag: compoundTag,
            researchSignal: researchSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
