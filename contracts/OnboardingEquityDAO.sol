// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract OnboardingEquityDAO {
    address public originator;

    struct EquitySignal {
        string region;
        string onboardingFormat;
        string reviewerAssigned;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    EquitySignal[] public equityLedger;

    constructor() {
        originator = msg.sender;
    }

    function logEquitySignal(
        string memory region,
        string memory onboardingFormat,
        string memory reviewerAssigned,
        bool isScrollchainSealed
    ) external {
        equityLedger.push(EquitySignal({
            region: region,
            onboardingFormat: onboardingFormat,
            reviewerAssigned: reviewerAssigned,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
