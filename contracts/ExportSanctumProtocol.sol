// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ExportSanctumProtocol {
    address public originator;

    struct ExportScroll {
        string productTag;
        string originCountry;
        string retailTarget;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ExportScroll[] public exportLedger;

    constructor() {
        originator = msg.sender;
    }

    function logExportScroll(
        string memory productTag,
        string memory originCountry,
        string memory retailTarget,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        exportLedger.push(ExportScroll({
            productTag: productTag,
            originCountry: originCountry,
            retailTarget: retailTarget,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
