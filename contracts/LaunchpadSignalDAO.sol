// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LaunchpadSignalDAO {
    address public originator;

    struct LaunchSignal {
        string projectName;
        bool isConvictionBased;
        bool isSyntheticLinked;
        bool isEmotionallyTagged;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    LaunchSignal[] public launchLedger;

    constructor() {
        originator = msg.sender;
    }

    function logLaunchSignal(
        string memory projectName,
        bool isConvictionBased,
        bool isSyntheticLinked,
        bool isEmotionallyTagged,
        bool isScrollchainSealed
    ) external {
        launchLedger.push(LaunchSignal({
            projectName: projectName,
            isConvictionBased: isConvictionBased,
            isSyntheticLinked: isSyntheticLinked,
            isEmotionallyTagged: isEmotionallyTagged,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
