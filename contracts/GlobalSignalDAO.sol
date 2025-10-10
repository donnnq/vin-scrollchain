// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GlobalSignalDAO {
    address public originator;

    struct GlobalSignal {
        string region;
        string cryptoPolicy;
        string impactLevel;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    GlobalSignal[] public signalLedger;

    constructor() {
        originator = msg.sender;
    }

    function logGlobalSignal(
        string memory region,
        string memory cryptoPolicy,
        string memory impactLevel,
        bool isScrollchainSealed
    ) external {
        signalLedger.push(GlobalSignal({
            region: region,
            cryptoPolicy: cryptoPolicy,
            impactLevel: impactLevel,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
