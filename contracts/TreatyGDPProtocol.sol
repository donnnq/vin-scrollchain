// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TreatyGDPProtocol {
    address public originator;

    struct GDPScroll {
        string productTag;
        string exportCorridor;
        string ignitionSignal;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    GDPScroll[] public gdpLedger;

    constructor() {
        originator = msg.sender;
    }

    function logGDPScroll(
        string memory productTag,
        string memory exportCorridor,
        string memory ignitionSignal,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        gdpLedger.push(GDPScroll({
            productTag: productTag,
            exportCorridor: exportCorridor,
            ignitionSignal: ignitionSignal,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
