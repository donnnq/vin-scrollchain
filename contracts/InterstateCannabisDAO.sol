// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract InterstateCannabisDAO {
    address public originator;

    struct CommerceSignal {
        string stateOrRegion;
        bool interstateAllowed;
        bool cultivationProtected;
        bool exciseTaxEnabled;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    CommerceSignal[] public commerceLedger;

    constructor() {
        originator = msg.sender;
    }

    function logCommerceSignal(
        string memory stateOrRegion,
        bool interstateAllowed,
        bool cultivationProtected,
        bool exciseTaxEnabled,
        bool isScrollchainSealed
    ) external {
        commerceLedger.push(CommerceSignal({
            stateOrRegion: stateOrRegion,
            interstateAllowed: interstateAllowed,
            cultivationProtected: cultivationProtected,
            exciseTaxEnabled: exciseTaxEnabled,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
