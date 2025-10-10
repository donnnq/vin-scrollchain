// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PhishingAuditDAO {
    address public originator;

    struct AuditSignal {
        string packageName;
        string threatType;
        string redirectURL;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    AuditSignal[] public phishingLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAuditSignal(
        string memory packageName,
        string memory threatType,
        string memory redirectURL,
        bool isScrollchainSealed
    ) external {
        phishingLedger.push(AuditSignal({
            packageName: packageName,
            threatType: threatType,
            redirectURL: redirectURL,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
