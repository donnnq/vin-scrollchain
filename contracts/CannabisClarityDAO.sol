// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CannabisClarityDAO {
    address public originator;

    struct ClaritySignal {
        string country;
        string dosageFocus;
        bool thcClarityEnabled;
        bool dosageSovereigntyProtected;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ClaritySignal[] public clarityLedger;

    constructor() {
        originator = msg.sender;
    }

    function logClaritySignal(
        string memory country,
        string memory dosageFocus,
        bool thcClarityEnabled,
        bool dosageSovereigntyProtected,
        bool isScrollchainSealed
    ) external {
        clarityLedger.push(ClaritySignal({
            country: country,
            dosageFocus: dosageFocus,
            thcClarityEnabled: thcClarityEnabled,
            dosageSovereigntyProtected: dosageSovereigntyProtected,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
