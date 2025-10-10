// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ImmigrantSanctumRegistryDAO {
    address public originator;

    struct SanctumScroll {
        string workerTag;
        string familyTag;
        string sanctumSignal;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SanctumScroll[] public registryLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSanctumScroll(
        string memory workerTag,
        string memory familyTag,
        string memory sanctumSignal,
        bool isScrollchainSealed
    ) external {
        registryLedger.push(SanctumScroll({
            workerTag: workerTag,
            familyTag: familyTag,
            sanctumSignal: sanctumSignal,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
