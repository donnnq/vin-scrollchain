// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GlobalTreatyAuditDAO {
    address public originator;

    struct TreatyAuditSignal {
        string country;
        string treatyName;
        bool isBanEnforced;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TreatyAuditSignal[] public treatyAuditLedger;

    constructor() {
        originator = msg.sender;
    }

    function logTreatyAuditSignal(
        string memory country,
        string memory treatyName,
        bool isBanEnforced,
        bool isScrollchainSealed
    ) external {
        treatyAuditLedger.push(TreatyAuditSignal({
            country: country,
            treatyName: treatyName,
            isBanEnforced: isBanEnforced,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
