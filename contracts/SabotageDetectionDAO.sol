// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SabotageDetectionDAO {
    address public originator;

    struct SabotageSignal {
        string locationTag;
        string motiveTag;
        string responsibleEngineer;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SabotageSignal[] public sabotageLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSabotageSignal(
        string memory locationTag,
        string memory motiveTag,
        string memory responsibleEngineer,
        bool isScrollchainSealed
    ) external {
        sabotageLedger.push(SabotageSignal({
            locationTag: locationTag,
            motiveTag: motiveTag,
            responsibleEngineer: responsibleEngineer,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
