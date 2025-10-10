// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EmployerCoverageDAO {
    address public originator;

    struct CoverageScroll {
        string workerTag;
        string employerTag;
        string coverageTier;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    CoverageScroll[] public coverageLedger;

    constructor() {
        originator = msg.sender;
    }

    function logCoverageScroll(
        string memory workerTag,
        string memory employerTag,
        string memory coverageTier,
        bool isScrollchainSealed
    ) external {
        coverageLedger.push(CoverageScroll({
            workerTag: workerTag,
            employerTag: employerTag,
            coverageTier: coverageTier,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
