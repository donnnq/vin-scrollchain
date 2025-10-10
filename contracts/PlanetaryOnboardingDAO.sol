// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PlanetaryOnboardingDAO {
    address public originator;

    struct OnboardingSignal {
        string region;
        string employmentSignal;
        string onboardingFormat;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    OnboardingSignal[] public onboardingLedger;

    constructor() {
        originator = msg.sender;
    }

    function logOnboardingSignal(
        string memory region,
        string memory employmentSignal,
        string memory onboardingFormat,
        bool isScrollchainSealed
    ) external {
        onboardingLedger.push(OnboardingSignal({
            region: region,
            employmentSignal: employmentSignal,
            onboardingFormat: onboardingFormat,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
