// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CompensationSanctumRegistry {
    address public originator;

    struct SanctumScroll {
        string agencyTag;
        string regionTag;
        string wageTier;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SanctumScroll[] public sanctumLedger;

    constructor() {
        originator = msg.sender;
    }

    function registerSanctum(
        string memory agencyTag,
        string memory regionTag,
        string memory wageTier,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        sanctumLedger.push(SanctumScroll({
            agencyTag: agencyTag,
            regionTag: regionTag,
            wageTier: wageTier,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
