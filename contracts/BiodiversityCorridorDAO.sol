// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BiodiversityCorridorDAO {
    address public originator;

    struct CorridorSignal {
        string corridorName;
        string habitatType;
        string restorationFocus;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    CorridorSignal[] public corridorLedger;

    constructor() {
        originator = msg.sender;
    }

    function logCorridorSignal(
        string memory corridorName,
        string memory habitatType,
        string memory restorationFocus,
        bool isScrollchainSealed
    ) external {
        corridorLedger.push(CorridorSignal({
            corridorName: corridorName,
            habitatType: habitatType,
            restorationFocus: restorationFocus,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
