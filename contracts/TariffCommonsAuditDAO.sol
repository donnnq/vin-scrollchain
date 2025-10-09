// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TariffCommonsAuditDAO {
    address public originator;

    struct AuditScroll {
        string commodityTag;
        string sourceCountry;
        uint256 tariffAmount;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    AuditScroll[] public auditLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAuditScroll(
        string memory commodityTag,
        string memory sourceCountry,
        uint256 tariffAmount,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        auditLedger.push(AuditScroll({
            commodityTag: commodityTag,
            sourceCountry: sourceCountry,
            tariffAmount: tariffAmount,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
