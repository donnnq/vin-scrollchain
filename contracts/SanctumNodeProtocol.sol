// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SanctumNodeProtocol {
    address public originator;

    struct NodeScroll {
        string regionTag;
        string nodeType;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    NodeScroll[] public nodeLedger;

    constructor() {
        originator = msg.sender;
    }

    function logNodeScroll(
        string memory regionTag,
        string memory nodeType,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        nodeLedger.push(NodeScroll({
            regionTag: regionTag,
            nodeType: nodeType,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
