// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ShutdownReparationsDAO {
    address public originator;

    struct ReparationScroll {
        string workerTag;
        string agencyTag;
        uint256 amount;
        string reparationSignal;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ReparationScroll[] public reparationLedger;

    constructor() {
        originator = msg.sender;
    }

    function logReparationScroll(
        string memory workerTag,
        string memory agencyTag,
        uint256 amount,
        string memory reparationSignal,
        bool isScrollchainSealed
    ) external {
        reparationLedger.push(ReparationScroll({
            workerTag: workerTag,
            agencyTag: agencyTag,
            amount: amount,
            reparationSignal: reparationSignal,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
