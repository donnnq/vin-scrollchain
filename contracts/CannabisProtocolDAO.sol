// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CannabisProtocolDAO {
    address public originator;

    struct ProtocolSignal {
        string country;
        string protocolFocus;
        bool sanctumEquityEnabled;
        bool dosageSovereigntyProtected;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ProtocolSignal[] public protocolLedger;

    constructor() {
        originator = msg.sender;
    }

    function logProtocolSignal(
        string memory country,
        string memory protocolFocus,
        bool sanctumEquityEnabled,
        bool dosageSovereigntyProtected,
        bool isScrollchainSealed
    ) external {
        protocolLedger.push(ProtocolSignal({
            country: country,
            protocolFocus: protocolFocus,
            sanctumEquityEnabled: sanctumEquityEnabled,
            dosageSovereigntyProtected: dosageSovereigntyProtected,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
