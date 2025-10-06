// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MechanicSanctumRegistry {
    address public originator;

    struct SanctumScroll {
        string shopName;
        string locationTag;
        string specialtyTag;
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
        string memory shopName,
        string memory locationTag,
        string memory specialtyTag,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        sanctumLedger.push(SanctumScroll({
            shopName: shopName,
            locationTag: locationTag,
            specialtyTag: specialtyTag,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
