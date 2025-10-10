// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FurloughJusticeDAO {
    address public originator;

    struct FurloughScroll {
        string workerTag;
        string factionTag;
        string furloughSignal;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    FurloughScroll[] public furloughLedger;

    constructor() {
        originator = msg.sender;
    }

    function logFurloughScroll(
        string memory workerTag,
        string memory factionTag,
        string memory furloughSignal,
        bool isScrollchainSealed
    ) external {
        furloughLedger.push(FurloughScroll({
            workerTag: workerTag,
            factionTag: factionTag,
            furloughSignal: furloughSignal,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
