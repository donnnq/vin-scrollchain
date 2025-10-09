// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract StartupReceiptsAtlasDAO {
    address public originator;

    struct AtlasScroll {
        string startupTag;
        string receiptsSignal;
        string atlasAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    AtlasScroll[] public atlasLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAtlasScroll(
        string memory startupTag,
        string memory receiptsSignal,
        string memory atlasAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        atlasLedger.push(AtlasScroll({
            startupTag: startupTag,
            receiptsSignal: receiptsSignal,
            atlasAction: atlasAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
