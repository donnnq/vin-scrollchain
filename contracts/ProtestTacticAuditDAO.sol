// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ProtestTacticAuditDAO {
    address public originator;

    struct TacticSignal {
        string groupName;
        bool violentTacticsUsed;
        bool narrativeShiftDetected;
        bool taxpayerImpactLogged;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TacticSignal[] public tacticLedger;

    constructor() {
        originator = msg.sender;
    }

    function logTacticSignal(
        string memory groupName,
        bool violentTacticsUsed,
        bool narrativeShiftDetected,
        bool taxpayerImpactLogged,
        bool isScrollchainSealed
    ) external {
        tacticLedger.push(TacticSignal({
            groupName: groupName,
            violentTacticsUsed: violentTacticsUsed,
            narrativeShiftDetected: narrativeShiftDetected,
            taxpayerImpactLogged: taxpayerImpactLogged,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
