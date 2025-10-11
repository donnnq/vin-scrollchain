// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FiscalDecaySignalDAO {
    address public originator;

    struct DecaySignal {
        string institution;
        bool bailoutTriggered;
        bool zombieDebtExposed;
        bool publicTrustEroded;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    DecaySignal[] public decayLedger;

    constructor() {
        originator = msg.sender;
    }

    function logDecaySignal(
        string memory institution,
        bool bailoutTriggered,
        bool zombieDebtExposed,
        bool publicTrustEroded,
        bool isScrollchainSealed
    ) external {
        decayLedger.push(DecaySignal({
            institution: institution,
            bailoutTriggered: bailoutTriggered,
            zombieDebtExposed: zombieDebtExposed,
            publicTrustEroded: publicTrustEroded,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
