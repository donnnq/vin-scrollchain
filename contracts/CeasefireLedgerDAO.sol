// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CeasefireLedgerDAO {
    address public originator;

    struct CeasefireScroll {
        string regionTag;
        string brokerSignal;
        string ceasefireAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    CeasefireScroll[] public ceasefireLedger;

    constructor() {
        originator = msg.sender;
    }

    function logCeasefireScroll(
        string memory regionTag,
        string memory brokerSignal,
        string memory ceasefireAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        ceasefireLedger.push(CeasefireScroll({
            regionTag: regionTag,
            brokerSignal: brokerSignal,
            ceasefireAction: ceasefireAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
