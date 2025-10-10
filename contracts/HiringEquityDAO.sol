// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HiringEquityDAO {
    address public originator;

    struct HiringSignal {
        string sector;
        string reviewerAssigned;
        string accessLevel;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    HiringSignal[] public equityLedger;

    constructor() {
        originator = msg.sender;
    }

    function logHiringSignal(
        string memory sector,
        string memory reviewerAssigned,
        string memory accessLevel,
        bool isScrollchainSealed
    ) external {
        equityLedger.push(HiringSignal({
            sector: sector,
            reviewerAssigned: reviewerAssigned,
            accessLevel: accessLevel,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
