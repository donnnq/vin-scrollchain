// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LieTrackingProtocol {
    address public originator;

    struct LieRecord {
        string officialTag;
        string lieStatement;
        string verificationMethod;
        uint256 addedYears;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    LieRecord[] public lieLedger;

    constructor() {
        originator = msg.sender;
    }

    function logLieRecord(
        string memory officialTag,
        string memory lieStatement,
        string memory verificationMethod,
        uint256 addedYears,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        lieLedger.push(LieRecord({
            officialTag: officialTag,
            lieStatement: lieStatement,
            verificationMethod: verificationMethod,
            addedYears: addedYears,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
