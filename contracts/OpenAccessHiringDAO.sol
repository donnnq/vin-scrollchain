// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract OpenAccessHiringDAO {
    address public originator;

    struct AccessSignal {
        string region;
        string onboardingFormat;
        string reviewerAssigned;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    AccessSignal[] public accessLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAccessSignal(
        string memory region,
        string memory onboardingFormat,
        string memory reviewerAssigned,
        bool isScrollchainSealed
    ) external {
        accessLedger.push(AccessSignal({
            region: region,
            onboardingFormat: onboardingFormat,
            reviewerAssigned: reviewerAssigned,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
