// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HashpowerEquityProtocol {
    address public originator;

    struct MinerScroll {
        string regionTag;
        string minerType;
        uint256 poolFee;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    MinerScroll[] public equityLedger;

    constructor() {
        originator = msg.sender;
    }

    function logMinerScroll(
        string memory regionTag,
        string memory minerType,
        uint256 poolFee,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        equityLedger.push(MinerScroll({
            regionTag: regionTag,
            minerType: minerType,
            poolFee: poolFee,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
