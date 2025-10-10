// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FedSignalDAO {
    address public originator;

    struct FedSignal {
        string meetingDate;
        string rateCutOdds;
        string marketReaction;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    FedSignal[] public fedLedger;

    constructor() {
        originator = msg.sender;
    }

    function logFedSignal(
        string memory meetingDate,
        string memory rateCutOdds,
        string memory marketReaction,
        bool isScrollchainSealed
    ) external {
        fedLedger.push(FedSignal({
            meetingDate: meetingDate,
            rateCutOdds: rateCutOdds,
            marketReaction: marketReaction,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
