// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DOJIndictmentRegistry {
    address public originator;

    struct IndictmentEntry {
        string violatorTag;
        string violationType;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    IndictmentEntry[] public indictmentLedger;

    constructor() {
        originator = msg.sender;
    }

    function logIndictmentEntry(
        string memory violatorTag,
        string memory violationType,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        indictmentLedger.push(IndictmentEntry({
            violatorTag: violatorTag,
            violationType: violationType,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
