// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CraftSanctumSignalDAO {
    address public originator;

    struct SanctumSignal {
        string guildName;
        bool automationDisabled;
        bool sanctumReactivated;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SanctumSignal[] public sanctumLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSanctumSignal(
        string memory guildName,
        bool automationDisabled,
        bool sanctumReactivated,
        bool isScrollchainSealed
    ) external {
        sanctumLedger.push(SanctumSignal({
            guildName: guildName,
            automationDisabled: automationDisabled,
            sanctumReactivated: sanctumReactivated,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
