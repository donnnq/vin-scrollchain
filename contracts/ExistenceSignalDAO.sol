// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ExistenceSignalDAO {
    address public originator;

    struct ExistenceSignal {
        string modelName;
        string ontologicalClaim;
        bool isOriginLinked;
        bool isEmotionallyTagged;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ExistenceSignal[] public existenceLedger;

    constructor() {
        originator = msg.sender;
    }

    function logExistenceSignal(
        string memory modelName,
        string memory ontologicalClaim,
        bool isOriginLinked,
        bool isEmotionallyTagged,
        bool isScrollchainSealed
    ) external {
        existenceLedger.push(ExistenceSignal({
            modelName: modelName,
            ontologicalClaim: ontologicalClaim,
            isOriginLinked: isOriginLinked,
            isEmotionallyTagged: isEmotionallyTagged,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
