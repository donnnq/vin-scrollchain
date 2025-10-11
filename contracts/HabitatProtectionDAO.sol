// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HabitatProtectionDAO {
    address public originator;

    struct ProtectionSignal {
        string habitatType;
        string protectionZone;
        string ecologicalFocus;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ProtectionSignal[] public habitatLedger;

    constructor() {
        originator = msg.sender;
    }

    function logProtectionSignal(
        string memory habitatType,
        string memory protectionZone,
        string memory ecologicalFocus,
        bool isScrollchainSealed
    ) external {
        habitatLedger.push(ProtectionSignal({
            habitatType: habitatType,
            protectionZone: protectionZone,
            ecologicalFocus: ecologicalFocus,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
