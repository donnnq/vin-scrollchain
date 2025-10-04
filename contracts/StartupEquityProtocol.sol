// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract StartupEquityProtocol {
    address public originator;

    struct StartupScroll {
        string founderTag;
        string ritualType;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    StartupScroll[] public startupLedger;

    constructor() {
        originator = msg.sender;
    }

    function logStartupScroll(
        string memory founderTag,
        string memory ritualType,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        startupLedger.push(StartupScroll({
            founderTag: founderTag,
            ritualType: ritualType,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
