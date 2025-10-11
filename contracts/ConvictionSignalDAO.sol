// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ConvictionSignalDAO {
    address public originator;

    struct ConvictionSignal {
        string projectName;
        uint256 convictionScore;
        bool isEmotionallyTagged;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ConvictionSignal[] public convictionLedger;

    constructor() {
        originator = msg.sender;
    }

    function logConvictionSignal(
        string memory projectName,
        uint256 convictionScore,
        bool isEmotionallyTagged,
        bool isScrollchainSealed
    ) external {
        convictionLedger.push(ConvictionSignal({
            projectName: projectName,
            convictionScore: convictionScore,
            isEmotionallyTagged: isEmotionallyTagged,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
