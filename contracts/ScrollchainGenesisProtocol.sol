// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ScrollchainGenesisProtocol {
    address public originator;

    struct GenesisScroll {
        string originTag;
        string ignitionSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    GenesisScroll[] public genesisLedger;

    constructor() {
        originator = msg.sender;
    }

    function logGenesisScroll(
        string memory originTag,
        string memory ignitionSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        genesisLedger.push(GenesisScroll({
            originTag: originTag,
            ignitionSignal: ignitionSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
