// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TrainerEquityDAO {
    address public originator;

    struct TrainerSignal {
        string region;
        string modelType;
        string trainerAssigned;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TrainerSignal[] public trainerLedger;

    constructor() {
        originator = msg.sender;
    }

    function logTrainerSignal(
        string memory region,
        string memory modelType,
        string memory trainerAssigned,
        bool isScrollchainSealed
    ) external {
        trainerLedger.push(TrainerSignal({
            region: region,
            modelType: modelType,
            trainerAssigned: trainerAssigned,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
