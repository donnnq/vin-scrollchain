// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract YouthBallotProtocol {
    address public originator;

    struct BallotScroll {
        string barangayTag;
        string youthTag;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    BallotScroll[] public ballotLedger;

    constructor() {
        originator = msg.sender;
    }

    function logBallotScroll(
        string memory barangayTag,
        string memory youthTag,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        ballotLedger.push(BallotScroll({
            barangayTag: barangayTag,
            youthTag: youthTag,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
