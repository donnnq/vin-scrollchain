// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DiasporaExportRegistry {
    address public originator;

    struct ExportScroll {
        string companyTag;
        string exportSignal;
        string registryAction;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ExportScroll[] public exportLedger;

    constructor() {
        originator = msg.sender;
    }

    function logExportScroll(
        string memory companyTag,
        string memory exportSignal,
        string memory registryAction,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        exportLedger.push(ExportScroll({
            companyTag: companyTag,
            exportSignal: exportSignal,
            registryAction: registryAction,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
