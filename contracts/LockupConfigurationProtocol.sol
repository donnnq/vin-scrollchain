// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LockupConfigurationProtocol {
    address public originator;

    struct LockupScroll {
        string validatorTag;
        uint256 lockupAmount;
        uint256 lockupDurationDays;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    LockupScroll[] public lockupLedger;

    constructor() {
        originator = msg.sender;
    }

    function logLockupScroll(
        string memory validatorTag,
        uint256 lockupAmount,
        uint256 lockupDurationDays,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        lockupLedger.push(LockupScroll({
            validatorTag: validatorTag,
            lockupAmount: lockupAmount,
            lockupDurationDays: lockupDurationDays,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
