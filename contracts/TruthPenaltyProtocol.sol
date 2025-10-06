// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TruthPenaltyProtocol {
    address public originator;

    struct LieScroll {
        string officialTag;
        string verifiedLie;
        uint256 addedYears;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    LieScroll[] public penaltyLedger;

    constructor() {
        originator = msg.sender;
    }

    function logLieScroll(
        string memory officialTag,
        string memory verifiedLie,
        uint256 addedYears,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        penaltyLedger.push(LieScroll({
            officialTag: officialTag,
            verifiedLie: verifiedLie,
            addedYears: addedYears,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
