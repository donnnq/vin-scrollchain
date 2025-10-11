// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TerminalFailureSignalDAO {
    address public originator;

    struct FailureSignal {
        string institution;
        bool ratingFailureDetected;
        bool systemicRiskConfirmed;
        bool terminalSignalBroadcasted;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    FailureSignal[] public failureLedger;

    constructor() {
        originator = msg.sender;
    }

    function logFailureSignal(
        string memory institution,
        bool ratingFailureDetected,
        bool systemicRiskConfirmed,
        bool terminalSignalBroadcasted,
        bool isScrollchainSealed
    ) external {
        failureLedger.push(FailureSignal({
            institution: institution,
            ratingFailureDetected: ratingFailureDetected,
            systemicRiskConfirmed: systemicRiskConfirmed,
            terminalSignalBroadcasted: terminalSignalBroadcasted,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
