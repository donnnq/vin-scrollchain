// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ImmigrantHealthPremiumDAO {
    address public originator;

    struct PremiumScroll {
        string workerTag;
        string employerTag;
        string premiumSignal;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    PremiumScroll[] public premiumLedger;

    constructor() {
        originator = msg.sender;
    }

    function logPremiumScroll(
        string memory workerTag,
        string memory employerTag,
        string memory premiumSignal,
        bool isScrollchainSealed
    ) external {
        premiumLedger.push(PremiumScroll({
            workerTag: workerTag,
            employerTag: employerTag,
            premiumSignal: premiumSignal,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
