// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EmbassyAuditProtocol {
    address public originator;

    struct AuditScroll {
        string embassyTag;
        string hostCountryTag;
        string accessSignal;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    AuditScroll[] public auditLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAuditScroll(
        string memory embassyTag,
        string memory hostCountryTag,
        string memory accessSignal,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        auditLedger.push(AuditScroll({
            embassyTag: embassyTag,
            hostCountryTag: hostCountryTag,
            accessSignal: accessSignal,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
