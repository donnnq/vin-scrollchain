// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ImmigrantHealthCardDAO {
    address public originator;

    struct HealthCardScroll {
        string workerTag;
        string familyTag;
        string cardSignal;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    HealthCardScroll[] public cardLedger;

    constructor() {
        originator = msg.sender;
    }

    function logHealthCardScroll(
        string memory workerTag,
        string memory familyTag,
        string memory cardSignal,
        bool isScrollchainSealed
    ) external {
        cardLedger.push(HealthCardScroll({
            workerTag: workerTag,
            familyTag: familyTag,
            cardSignal: cardSignal,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
