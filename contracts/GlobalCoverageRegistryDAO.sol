// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GlobalCoverageRegistryDAO {
    address public originator;

    struct RegistryScroll {
        string workerTag;
        string coverageTier;
        string registrySignal;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    RegistryScroll[] public registryLedger;

    constructor() {
        originator = msg.sender;
    }

    function logRegistryScroll(
        string memory workerTag,
        string memory coverageTier,
        string memory registrySignal,
        bool isScrollchainSealed
    ) external {
        registryLedger.push(RegistryScroll({
            workerTag: workerTag,
            coverageTier: coverageTier,
            registrySignal: registrySignal,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
