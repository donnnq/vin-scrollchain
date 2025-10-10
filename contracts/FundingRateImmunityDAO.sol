// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FundingRateImmunityDAO {
    address public originator;

    struct ImmunitySignal {
        string protocol;
        string fundingRateSpike;
        string cleansingAction;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ImmunitySignal[] public immunityLedger;

    constructor() {
        originator = msg.sender;
    }

    function logImmunitySignal(
        string memory protocol,
        string memory fundingRateSpike,
        string memory cleansingAction,
        bool isScrollchainSealed
    ) external {
        immunityLedger.push(ImmunitySignal({
            protocol: protocol,
            fundingRateSpike: fundingRateSpike,
            cleansingAction: cleansingAction,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
