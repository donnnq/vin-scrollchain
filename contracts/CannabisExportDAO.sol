// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CannabisExportDAO {
    address public originator;

    struct ExportSignal {
        string country;
        string productType;
        bool exportAllowed;
        bool dosageClarityRequired;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ExportSignal[] public exportLedger;

    constructor() {
        originator = msg.sender;
    }

    function logExportSignal(
        string memory country,
        string memory productType,
        bool exportAllowed,
        bool dosageClarityRequired,
        bool isScrollchainSealed
    ) external {
        exportLedger.push(ExportSignal({
            country: country,
            productType: productType,
            exportAllowed: exportAllowed,
            dosageClarityRequired: dosageClarityRequired,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
