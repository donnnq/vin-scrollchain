// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DiasporaNourishmentDAO {
    address public originator;

    struct NourishmentSignal {
        string snack;
        string region;
        string culturalSignificance;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    NourishmentSignal[] public nourishmentLedger;

    constructor() {
        originator = msg.sender;
    }

    function logNourishmentSignal(
        string memory snack,
        string memory region,
        string memory culturalSignificance,
        bool isScrollchainSealed
    ) external {
        nourishmentLedger.push(NourishmentSignal({
            snack: snack,
            region: region,
            culturalSignificance: culturalSignificance,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
