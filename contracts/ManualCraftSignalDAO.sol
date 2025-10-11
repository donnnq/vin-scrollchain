// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ManualCraftSignalDAO {
    address public originator;

    struct CraftSignal {
        string factoryName;
        bool automationDisabled;
        bool manualCraftRestored;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    CraftSignal[] public craftLedger;

    constructor() {
        originator = msg.sender;
    }

    function logCraftSignal(
        string memory factoryName,
        bool automationDisabled,
        bool manualCraftRestored,
        bool isScrollchainSealed
    ) external {
        craftLedger.push(CraftSignal({
            factoryName: factoryName,
            automationDisabled: automationDisabled,
            manualCraftRestored: manualCraftRestored,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
