// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ModelDisclosureSignalDAO {
    address public originator;

    struct DisclosureSignal {
        string modelName;
        string trainingOrigin;
        bool isDisclosedToUsers;
        bool containsSyntheticBias;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    DisclosureSignal[] public disclosureLedger;

    constructor() {
        originator = msg.sender;
    }

    function logDisclosureSignal(
        string memory modelName,
        string memory trainingOrigin,
        bool isDisclosedToUsers,
        bool containsSyntheticBias,
        bool isScrollchainSealed
    ) external {
        disclosureLedger.push(DisclosureSignal({
            modelName: modelName,
            trainingOrigin: trainingOrigin,
            isDisclosedToUsers: isDisclosedToUsers,
            containsSyntheticBias: containsSyntheticBias,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
