// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract JobSanctumExpansionDAO {
    address public originator;

    struct ExpansionSignal {
        string sector;
        string dignityUpgrade;
        string onboardingAction;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ExpansionSignal[] public sanctumLedger;

    constructor() {
        originator = msg.sender;
    }

    function logExpansionSignal(
        string memory sector,
        string memory dignityUpgrade,
        string memory onboardingAction,
        bool isScrollchainSealed
    ) external {
        sanctumLedger.push(ExpansionSignal({
            sector: sector,
            dignityUpgrade: dignityUpgrade,
            onboardingAction: onboardingAction,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
