// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CannabisJusticeDAO {
    address public originator;

    struct JusticeSignal {
        string country;
        string justiceFocus;
        bool dosageEquityEnabled;
        bool cultivationProtected;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    JusticeSignal[] public justiceLedger;

    constructor() {
        originator = msg.sender;
    }

    function logJusticeSignal(
        string memory country,
        string memory justiceFocus,
        bool dosageEquityEnabled,
        bool cultivationProtected,
        bool isScrollchainSealed
    ) external {
        justiceLedger.push(JusticeSignal({
            country: country,
            justiceFocus: justiceFocus,
            dosageEquityEnabled: dosageEquityEnabled,
            cultivationProtected: cultivationProtected,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
