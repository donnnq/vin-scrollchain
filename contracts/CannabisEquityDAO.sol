// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CannabisEquityDAO {
    address public originator;

    struct EquitySignal {
        string country;
        string equityFocus;
        bool cultivationLiberated;
        bool justiceReinvested;
        bool thcClarityEnabled;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    EquitySignal[] public equityLedger;

    constructor() {
        originator = msg.sender;
    }

    function logEquitySignal(
        string memory country,
        string memory equityFocus,
        bool cultivationLiberated,
        bool justiceReinvested,
        bool thcClarityEnabled,
        bool isScrollchainSealed
    ) external {
        equityLedger.push(EquitySignal({
            country: country,
            equityFocus: equityFocus,
            cultivationLiberated: cultivationLiberated,
            justiceReinvested: justiceReinvested,
            thcClarityEnabled: thcClarityEnabled,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
