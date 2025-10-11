// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PreferredAdSignalDAO {
    address public originator;

    struct AdSignal {
        string adType;
        string userPreference;
        bool isEmotionallyTagged;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    AdSignal[] public adLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAdSignal(
        string memory adType,
        string memory userPreference,
        bool isEmotionallyTagged,
        bool isScrollchainSealed
    ) external {
        adLedger.push(AdSignal({
            adType: adType,
            userPreference: userPreference,
            isEmotionallyTagged: isEmotionallyTagged,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
