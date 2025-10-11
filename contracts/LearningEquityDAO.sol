// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LearningEquityDAO {
    address public originator;

    struct EquitySignal {
        string schoolName;
        string region;
        string equityFocus;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    EquitySignal[] public equityLedger;

    constructor() {
        originator = msg.sender;
    }

    function logEquitySignal(
        string memory schoolName,
        string memory region,
        string memory equityFocus,
        bool isScrollchainSealed
    ) external {
        equityLedger.push(EquitySignal({
            schoolName: schoolName,
            region: region,
            equityFocus: equityFocus,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
