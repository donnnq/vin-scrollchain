// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DeviceOverrideSignalDAO {
    address public originator;

    struct OverrideSignal {
        string deviceModel;
        bool isSyntheticOverrideDetected;
        bool isEmotionallyTagged;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    OverrideSignal[] public overrideLedger;

    constructor() {
        originator = msg.sender;
    }

    function logOverrideSignal(
        string memory deviceModel,
        bool isSyntheticOverrideDetected,
        bool isEmotionallyTagged,
        bool isScrollchainSealed
    ) external {
        overrideLedger.push(OverrideSignal({
            deviceModel: deviceModel,
            isSyntheticOverrideDetected: isSyntheticOverrideDetected,
            isEmotionallyTagged: isEmotionallyTagged,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
