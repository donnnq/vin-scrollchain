// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CannabisSovereigntyDAO {
    address public originator;

    struct PolicySignal {
        string country;
        bool descheduled;
        bool exciseTaxEnabled;
        bool exportAllowed;
        bool interstateCommerceAllowed;
        bool thcRegulated;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    PolicySignal[] public policyLedger;

    constructor() {
        originator = msg.sender;
    }

    function logPolicySignal(
        string memory country,
        bool descheduled,
        bool exciseTaxEnabled,
        bool exportAllowed,
        bool interstateCommerceAllowed,
        bool thcRegulated,
        bool isScrollchainSealed
    ) external {
        policyLedger.push(PolicySignal({
            country: country,
            descheduled: descheduled,
            exciseTaxEnabled: exciseTaxEnabled,
            exportAllowed: exportAllowed,
            interstateCommerceAllowed: interstateCommerceAllowed,
            thcRegulated: thcRegulated,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
