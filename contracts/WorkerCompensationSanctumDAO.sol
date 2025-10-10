// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WorkerCompensationSanctumDAO {
    address public originator;

    struct CompensationScroll {
        string workerTag;
        string agencyTag;
        uint256 amount;
        string sanctumSignal;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    CompensationScroll[] public compensationLedger;

    constructor() {
        originator = msg.sender;
    }

    function logCompensationScroll(
        string memory workerTag,
        string memory agencyTag,
        uint256 amount,
        string memory sanctumSignal,
        bool isScrollchainSealed
    ) external {
        compensationLedger.push(CompensationScroll({
            workerTag: workerTag,
            agencyTag: agencyTag,
            amount: amount,
            sanctumSignal: sanctumSignal,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
